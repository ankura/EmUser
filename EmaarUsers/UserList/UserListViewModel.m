//
//  UserListViewModel.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "UserListViewModel.h"
#import "NetworkServiceModel.h"
#import "EmaarUser.h"

@interface UserListViewModel ()

@property (nonatomic, strong) NetworkServiceModel * networkServiceModel;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic, assign) int offset;


@end


@implementation UserListViewModel

- (instancetype)initWithDelegate:(id<UserListViewModelDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        _users = [[NSMutableArray alloc] init];
        _offset = 0;
        self.networkServiceModel = [[NetworkServiceModel alloc] init];
    }

    return self;
}

- (void)setUsers:(NSMutableArray *)users {
    
    if(users.count > 0) {
        for(User *user in users) {
            [_users addObject:[[UserModel alloc] initWithDictionary:user]];
        }
        if (self.delegate != nil) {
            [self.delegate parseUsersSuccess];
        }
    }
}

- (void)getUserData {
    
    // get max to max 200 only, as we are not deleting the data
    if([DatabaseManager getCountForEntity:DBEntityObjectUser] < 200) {
        
        [self.networkServiceModel getUserData:^(NSDictionary *responseDict) {
            NSLog(@"%@",responseDict);
            
            if(responseDict[@"results"] != nil && [responseDict[@"results"] isKindOfClass:[NSArray class]]) {
                
                NSArray * resultsDictionaries = responseDict[@"results"];
                
                for(NSDictionary * resultsDictionary in resultsDictionaries) {
                    
                    EmaarUser * resultsItem = [[EmaarUser alloc] initWithDictionary:resultsDictionary];
                    User *userEntity;
                    
                    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uuid == %@", resultsItem.login.uuid];
                    NSArray *filteredArray = [DatabaseManager getObjectsforEntity:DBEntityObjectUser sortBy:nil isAscending:YES predicate:predicate count:-1];
                    
                    if(filteredArray != nil && [filteredArray count] > 0) {
                        userEntity = filteredArray[0];
                    } else {
                        userEntity = (User *)[DatabaseManager createObjectForEntity:DBEntityObjectUser];
                        userEntity.uuid = resultsItem.login.uuid;
                    }
                    userEntity.first_name = resultsItem.name.first;
                    userEntity.last_name = resultsItem.name.first;
                    userEntity.email = resultsItem.email;
                    userEntity.city = resultsItem.location.city;
                    userEntity.state = resultsItem.location.state;
                    userEntity.country = resultsItem.location.country;
                    userEntity.postcode = resultsItem.location.postcode;
                    userEntity.image_url = resultsItem.picture.large;
                    userEntity.registered_date = resultsItem.registered.date;
                    userEntity.dob_date = resultsItem.dob.date;
                    userEntity.age = resultsItem.dob.age;
                    
                    [DatabaseManager updateDatabaseEntity];
                    
                }
                
                [DatabaseManager savePersistedData];
                
                [self getUsersFromDB:self.offset];
                
            } else {
                NSLog(@"No data");
                [self.delegate parseUsersFailedWithMessage:@"No data"];
            }
            
        } failure:^(NSError *error) {
            // error handling here ...
            NSLog(@"%@",error);
            [self.delegate parseUsersFailedWithMessage:@"Error in getting data"];
        }];
    } else {
        [self getUsersFromDB:self.offset];
    }
}

- (void)getUsersFromDB:(int)offset {
    
    NSMutableArray *usersFromDB = [DatabaseManager getObjectsforEntity:DBEntityObjectUser offSet:offset];
    if(usersFromDB != nil && usersFromDB.count > 0) {
        [self setUsers:usersFromDB];
        self.offset += userCount;
    }
    
}

- (int)numberOfUsers {
    if(self.users) {
        return (int)[self.users count];
    } else {
        return  0;
    }
}

- (UserModel *)userAt:(NSInteger)atIndex {
    return self.users[atIndex];
}

- (void)getMoreDataFromDB {
    
    [self getUsersFromDB:self.offset];
}




@end
