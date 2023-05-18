//
//  UserListViewController.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "UserListViewController.h"
#import "UserListViewModel.h"
#import "UserTableViewCell.h"
#import "DatabaseManager.h"
#import "EmaarUsers-Swift.h"

@class UserDetailViewController;

static int const totalUserCount = 100;

typedef NS_ENUM(NSUInteger, TableSection) {
        userList = 0,
        loader,
    };

@interface UserListViewController () <UITableViewDataSource, UITableViewDelegate, UserListViewModelDelegate>

    @property (nonatomic, strong) UserListViewModel * userListViewModel;
    @property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"User List";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.userListViewModel = [[UserListViewModel alloc] initWithDelegate:self];
    [self getData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)getData {
    [self.userListViewModel getUserData];
}

#pragma mark - TableView Datasource && Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableSection type = (TableSection) section;
    switch(type) {
        case userList:
            return self.userListViewModel.numberOfUsers;
            break;
        case loader:
            return self.userListViewModel.numberOfUsers < totalUserCount ? 1 : 0;
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableSection type = (TableSection) indexPath.section;
    switch(type) {
        case userList: {
            UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            UserModel *user = [self.userListViewModel userAt:indexPath.row];
            //NSLog(@"Row %ld - Name %@",(long)indexPath.row, user.name);
            [cell configure:user];
            return cell;
        }
            break;
        case loader: {
            UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            cell.nameLabel.text = @"Loading..";
            cell.emailLabel.text = @"";
            cell.countryLabel.text = @"";
            cell.registeredLabel.text = @"";
            return cell;
        }
        default:
            return nil;
            break;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TableSection type = (TableSection) indexPath.section;
    if (type == loader && self.userListViewModel.numberOfUsers > 0) {
        NSLog(@"load data..");
        [self.userListViewModel getMoreDataFromDB];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UserDetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"UserDetailVC"];
    UserModel *user = [self.userListViewModel userAt:indexPath.row];
    [detailVC setUserUuid:user.uuid];
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}

#pragma mark - UserListViewModelDelegate methods

- (void)parseUsersFailedWithMessage:(NSString *)message {
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil]; //You can use a block here to handle a press on this button
        [alertController addAction:actionOk];
        [weakSelf presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)parseUsersSuccess {
    
    // reload the table
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
    
}



@end


