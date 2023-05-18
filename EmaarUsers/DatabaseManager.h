//
//  DatabaseManager.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//


//core data classes
#import "User+CoreDataClass.h"

static int const userCount = 30;

typedef NS_ENUM(NSInteger, DBEntityObject) {
    DBEntityObjectUser,
};

@interface DatabaseManager : NSObject

+ (nonnull instancetype)instance;

+ (void)savePersistedData;
+ (void)updateDatabaseEntity;
+ (void)resetAllData;

+ (nullable id)createObjectForEntity:(DBEntityObject)entity;
//+ (nonnull NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity;
+ (nonnull NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity sortBy:(nullable NSString *)strSort isAscending:(BOOL)ascending predicate:(nullable NSPredicate *)predicate count:(int)entityCount;
+ (nonnull NSMutableArray *)getObjectsforEntity:(DBEntityObject)entity offSet:(int)offset;
+ (int)getCountForEntity:(DBEntityObject)entity;

@end
