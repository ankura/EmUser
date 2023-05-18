//
//	EmaarUser.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "EmaarUser.h"

NSString *const kEmaarUserDob = @"dob";
NSString *const kEmaarUserEmail = @"email";
NSString *const kEmaarUserLocation = @"location";
NSString *const kEmaarUserLogin = @"login";
NSString *const kEmaarUserName = @"name";
NSString *const kEmaarUserPicture = @"picture";
NSString *const kEmaarUserRegistered = @"registered";

@interface EmaarUser ()
@end
@implementation EmaarUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kEmaarUserDob] isKindOfClass:[NSNull class]]){
		self.dob = [[Dob alloc] initWithDictionary:dictionary[kEmaarUserDob]];
	}

	if(![dictionary[kEmaarUserEmail] isKindOfClass:[NSNull class]]){
		self.email = dictionary[kEmaarUserEmail];
	}	
	if(![dictionary[kEmaarUserLocation] isKindOfClass:[NSNull class]]){
		self.location = [[Location alloc] initWithDictionary:dictionary[kEmaarUserLocation]];
	}

	if(![dictionary[kEmaarUserLogin] isKindOfClass:[NSNull class]]){
		self.login = [[Login alloc] initWithDictionary:dictionary[kEmaarUserLogin]];
	}

	if(![dictionary[kEmaarUserName] isKindOfClass:[NSNull class]]){
		self.name = [[Name alloc] initWithDictionary:dictionary[kEmaarUserName]];
	}

	if(![dictionary[kEmaarUserPicture] isKindOfClass:[NSNull class]]){
		self.picture = [[Picture alloc] initWithDictionary:dictionary[kEmaarUserPicture]];
	}

	if(![dictionary[kEmaarUserRegistered] isKindOfClass:[NSNull class]]){
		self.registered = [[Dob alloc] initWithDictionary:dictionary[kEmaarUserRegistered]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.dob != nil){
		dictionary[kEmaarUserDob] = [self.dob toDictionary];
	}
	if(self.email != nil){
		dictionary[kEmaarUserEmail] = self.email;
	}
	if(self.location != nil){
		dictionary[kEmaarUserLocation] = [self.location toDictionary];
	}
	if(self.login != nil){
		dictionary[kEmaarUserLogin] = [self.login toDictionary];
	}
	if(self.name != nil){
		dictionary[kEmaarUserName] = [self.name toDictionary];
	}
	if(self.picture != nil){
		dictionary[kEmaarUserPicture] = [self.picture toDictionary];
	}
	if(self.registered != nil){
		dictionary[kEmaarUserRegistered] = [self.registered toDictionary];
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.dob != nil){
		[aCoder encodeObject:self.dob forKey:kEmaarUserDob];
	}
	if(self.email != nil){
		[aCoder encodeObject:self.email forKey:kEmaarUserEmail];
	}
	if(self.location != nil){
		[aCoder encodeObject:self.location forKey:kEmaarUserLocation];
	}
	if(self.login != nil){
		[aCoder encodeObject:self.login forKey:kEmaarUserLogin];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kEmaarUserName];
	}
	if(self.picture != nil){
		[aCoder encodeObject:self.picture forKey:kEmaarUserPicture];
	}
	if(self.registered != nil){
		[aCoder encodeObject:self.registered forKey:kEmaarUserRegistered];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.dob = [aDecoder decodeObjectForKey:kEmaarUserDob];
	self.email = [aDecoder decodeObjectForKey:kEmaarUserEmail];
	self.location = [aDecoder decodeObjectForKey:kEmaarUserLocation];
	self.login = [aDecoder decodeObjectForKey:kEmaarUserLogin];
	self.name = [aDecoder decodeObjectForKey:kEmaarUserName];
	self.picture = [aDecoder decodeObjectForKey:kEmaarUserPicture];
	self.registered = [aDecoder decodeObjectForKey:kEmaarUserRegistered];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	EmaarUser *copy = [EmaarUser new];

	copy.dob = [self.dob copy];
	copy.email = [self.email copy];
	copy.location = [self.location copy];
	copy.login = [self.login copy];
	copy.name = [self.name copy];
	copy.picture = [self.picture copy];
	copy.registered = [self.registered copy];

	return copy;
}
@end