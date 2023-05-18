//
//  UserTableViewCell.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//


#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *registeredLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;


- (void)configure:(UserModel *)user;
@end

