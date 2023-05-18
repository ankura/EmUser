//
//  UserListViewModel.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <UIKit/UIKit.h>
#import "DatabaseManager.h"
#import "UserModel.h"

@protocol UserListViewModelDelegate <NSObject>
- (void)parseUsersSuccess;
- (void)parseUsersFailedWithMessage:(NSString *)message;
@end


@interface UserListViewModel : NSObject

@property (nonatomic, weak) id <UserListViewModelDelegate> delegate;



- (instancetype)initWithDelegate:(id<UserListViewModelDelegate>)delegate;

- (void)getUserData;
- (int)numberOfUsers;
- (UserModel *)userAt:(NSInteger)atIndex;
- (void)getMoreDataFromDB;


@end
