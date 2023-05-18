//
//  PersistenceController.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "PersistenceController.h"

@interface PersistenceController()

@property (strong, readwrite) NSManagedObjectContext *managedObjectContext;

@end

@implementation PersistenceController

- (id)init {
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"EmaarUsers" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"EmaarUsers.sqlite"];
    
    NSMutableDictionary *options = [NSMutableDictionary dictionary];
    options[NSMigratePersistentStoresAutomaticallyOption] = @YES;
    options[NSInferMappingModelAutomaticallyOption] = @YES;
    options[NSSQLitePragmasOption] = @{ @"journal_mode":@"DELETE" };
    
    NSError *error = nil;
 
    @try {
        [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    }
    @catch (NSException *exception) {
        NSLog(@"Error initializing PSC: %@", exception.reason);
    }
    
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.retainsRegisteredObjects = true;
    self.managedObjectContext.stalenessInterval = 0;
    self.managedObjectContext.persistentStoreCoordinator = coordinator;
    
    NSLog(@"CoreData initialization complete.");
    
    return self;
}



- (void)save {
    
    if (![[self managedObjectContext] hasChanges]) { return; }
 
    [[self managedObjectContext] setMergePolicy:[[NSMergePolicy alloc] initWithMergeType:NSMergeByPropertyObjectTrumpMergePolicyType]];

    [[self managedObjectContext] performBlockAndWait:^{
        NSError *error = nil;
        
        @try {
            [[self managedObjectContext] save:&error];
        }
        @catch (NSException *exception) {
            NSLog(@"Failed to save main context: %@", exception.reason);
        }
    }];
}

- (void)saveAsync {
    
    if (![[self managedObjectContext] hasChanges]) { return; }
    
    [[self managedObjectContext] performBlock:^{
        NSError *error = nil;
        
        @try {
            [[self managedObjectContext] save:&error];
        }
        @catch (NSException *exception) {
            NSLog(@"Failed to save main context: %@", exception.reason);
        }
    }];
}

// Method to delete all the data from coredata entities
- (void)deleteAll {
    
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"EmaarUsers.sqlite"];
    @try {
        [[self managedObjectContext].persistentStoreCoordinator destroyPersistentStoreAtURL:storeURL withType:NSSQLiteStoreType options:nil error:&error];
    } @catch (NSException *exception) {
        NSLog(@"Failed to save main context: %@", exception.reason);
    }
}

@end
