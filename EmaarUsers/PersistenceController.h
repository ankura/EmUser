//
//  PersistenceController.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistenceController : NSObject

@property (strong, readonly) NSManagedObjectContext *managedObjectContext;

- (id)init;
- (void)save;
- (void)saveAsync;
- (void)deleteAll;

@end


