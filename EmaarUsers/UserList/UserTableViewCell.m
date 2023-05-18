//
//  UserTableViewCell.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "UserTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


/// Configure User Table cell
- (void)configure:(UserModel *)user {
    
    self.nameLabel.text = user.name;
    self.emailLabel.text = user.email;
    
    NSString *tempStr = @"Country";
    NSString *country = [NSString stringWithFormat:@"%@ | %@",tempStr, user.country];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:country attributes:nil];

    [attributedString addAttribute: NSFontAttributeName value:[UIFont boldSystemFontOfSize:(self.countryLabel.font.pointSize)] range:[country rangeOfString:tempStr]];
    
    self.countryLabel.attributedText = attributedString;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *date = [dateFormatter dateFromString:user.registered];
    
    NSDateFormatter *dateFormatterConvert = [[NSDateFormatter alloc] init];
    [dateFormatterConvert setDateFormat:@"MMM d, yyyy"];

    self.registeredLabel.text = [dateFormatterConvert stringFromDate:date];
    static UIImage *placeholderImage = nil;
    if (!placeholderImage) {
        placeholderImage = [UIImage imageNamed:@"placeholder"];
    }
    
    SDImageResizingTransformer *transformer = [SDImageResizingTransformer transformerWithSize:CGSizeMake(50.0, 50.0) scaleMode:SDImageScaleModeAspectFit];
    SDWebImageContext* context = @{SDWebImageContextImageTransformer:transformer};
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:user.imageUrl] placeholderImage:placeholderImage options:0 context:context];
}

@end
