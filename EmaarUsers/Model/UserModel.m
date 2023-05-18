//
//  UserModel.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "User+CoreDataClass.h"


@interface UserModel ()
@end


@implementation UserModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(User *)user
{
    self = [super init];
    if(user.first_name != nil) {
        _name = [NSString stringWithFormat:@"%@",user.first_name];
        if(user.last_name != nil) {
            _name = [NSString stringWithFormat:@"%@ %@",_name, user.last_name];
        }
    }
    
    if(user.email != nil) {
        _email = [NSString stringWithFormat:@"%@",user.email];
    }
    
    if(user.dob_date != nil) {
        _dob = [NSString stringWithFormat:@"%@",user.dob_date];
    }
    
    if(user.registered_date != nil) {
        _registered = [NSString stringWithFormat:@"%@",user.registered_date];
    }
    
    if(user.registered_date != nil) {
        _registered = [NSString stringWithFormat:@"%@",user.registered_date];
    }
    
    _age = user.age;
    
    if(user.city != nil) {
        _city = [NSString stringWithFormat:@"%@",user.city];
    }
    
    if(user.state != nil) {
        _state = [NSString stringWithFormat:@"%@",user.state];
    }
    
    if(user.country != nil) {
        _country = [NSString stringWithFormat:@"%@",user.country];
    }
    
    if(user.postcode != nil) {
        _postcode = [NSString stringWithFormat:@"%@",user.postcode];
    }
    
    if(user.image_url != nil) {
        _imageUrl = [NSString stringWithFormat:@"%@",user.image_url];
    }
    
    if(user.uuid != nil) {
        _uuid = [NSString stringWithFormat:@"%@",user.uuid];
    }
    
    return self;
}


@end
