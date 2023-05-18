//
//  DatabaseManager.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "DatabaseManager.h"
#import "PersistenceController.h"



@implementation DatabaseManager

+ (nonnull instancetype)instance {
    static dispatch_once_t onceToken;
    static DatabaseManager *instance;
    dispatch_once (&onceToken, ^{
        instance = [[DatabaseManager alloc] init];
    });
    return instance;
}

#pragma mark -

+ (NSString *)nameForEntity:(DBEntityObject)entity {
    switch (entity) {
        case DBEntityObjectUser:
            return @"User";
        default:
            return @"User";
    }
}

#pragma mark - public class methods

+ (void)savePersistedData {
    
    [[DatabaseManager instance].persistenceController save];
}

+ (void)updateDatabaseEntity {
    
    NSError *error = nil;
    
    if (![[[DatabaseManager instance] managedObjectContext] save:&error]) {
        NSLog(@"DB changes were not saved.");
        NSLog(@"Error %@", error.description);
    }
}

+ (id)createObjectForEntity:(DBEntityObject)entity {
    return [[DatabaseManager instance] createObjectForEntity:[DatabaseManager nameForEntity:entity]];
}

//+ (NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity {
//    return [[DatabaseManager instance] getObjectsforEntity:[DatabaseManager nameForEntity:entity]
//                                                       sortBy:nil
//                                                  isAscending:NO
//                                                    predicate:nil
//                                                        count:-1
//                                                        offSet:-1];
//}

/// Method to get list of events not synced on server using predicate and count of entity records
+ (NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity sortBy:(NSString *)strSort isAscending:(BOOL)ascending predicate:(NSPredicate *)predicate count:(int)entityCount {
    return [[DatabaseManager instance] getObjectsforEntity:[DatabaseManager nameForEntity:entity]
                                                       sortBy:strSort
                                                  isAscending:ascending
                                                    predicate:predicate
                                                    count:entityCount
                                                    offSet:-1];
}

+ (NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity offSet:(int)offset {
    return [[DatabaseManager instance] getObjectsforEntity:[DatabaseManager nameForEntity:entity]
                                                       sortBy:nil
                                                  isAscending:NO
                                                    predicate:nil
                                                    count:userCount
                                                    offSet:offset];
}


+ (int)getCountForEntity:(DBEntityObject)entity {
    return (int)[[DatabaseManager instance] getCountForEntity:[DatabaseManager nameForEntity:entity]];
}


// Method to reset/delete all the data
+ (void)resetAllData {
    
    [[DatabaseManager instance].persistenceController deleteAll];
    // remove the stored persistence controller from the current thread so that a new can be created.
    NSThread *currentThread = [NSThread currentThread];
    [[currentThread threadDictionary] removeObjectForKey:@"persistenceController"];
}

#pragma mark - private instance methods

- (PersistenceController *)persistenceController {
    
    NSThread *currentThread = [NSThread currentThread];
    
    PersistenceController* persistenceController = (PersistenceController*)[[currentThread threadDictionary] objectForKey:@"persistenceController"];
    
    if (persistenceController == nil) {
        
        persistenceController = [[PersistenceController alloc] init];
        
        [[currentThread threadDictionary] setObject:persistenceController forKey:@"persistenceController"];
    }
    
    return persistenceController;
}

- (NSManagedObjectContext *)managedObjectContext {
    
    return [self persistenceController].managedObjectContext;
}

#pragma mark - Creating Objects

- (id)createObjectForEntity:(NSString *)entityName {
    return [self createObjectForEntity:entityName
                               context:[self managedObjectContext]];
}

- (id)createObjectForEntity:(NSString *)entityName context:(NSManagedObjectContext *)aContext {

    if (entityName != nil && ![entityName isEqualToString:@""]) {
         NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName
                                                             inManagedObjectContext:aContext];
        
        return [[NSManagedObject alloc] initWithEntity:entityDescription
                        insertIntoManagedObjectContext:aContext];
        
    } else {
        return nil;
    }
}

#pragma mark - Retrive Objects

- (NSMutableArray *)getObjectsforEntity:(NSString *)strEntity sortBy:(NSString *)strSort isAscending:(BOOL)ascending predicate:(NSPredicate *)predicate count:(int)entityCount offSet:(int)offset {

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:strEntity];
    
    if (strSort != nil && strSort.length > 0) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:strSort ascending:ascending];
        [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    }
    
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }
    
    // if entity count is -1, consider all entries from db
    if (entityCount != -1) {
        [fetchRequest setFetchLimit:entityCount];
    }
    
    if(offset != -1) {
        [fetchRequest setFetchOffset:offset];
    }
    
    NSError *error;
    NSArray * result;
    @try {
        result = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    } @catch (NSException *exception) {
        NSLog(@"getObjectsforEntity : %@", exception.reason);
    }
    
    return [result mutableCopy];
    
}

- (NSUInteger) getCountForEntity:(NSString *)strEntity {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:strEntity];

    [fetchRequest setIncludesSubentities:NO]; //Omit subentities. Default is YES (i.e. include subentities)
    
    NSError *error;
    NSUInteger count = 0;
    @try {
        count = [[self managedObjectContext] countForFetchRequest:fetchRequest error:&error];
    } @catch (NSException *exception) {
        NSLog(@"getObjectsforEntity : %@", exception.reason);
    }
    return count;
}


@end
