//
//  UserModel.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//


@class User;

@interface UserModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * registered;
@property (nonatomic, strong) NSString * dob;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * postcode;
@property (nonatomic, strong) NSString * uuid;
@property (nonatomic, strong) NSString * imageUrl;

-(instancetype)initWithDictionary:(User *)user;

@end
