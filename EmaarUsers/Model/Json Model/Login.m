//
//	Login.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Login.h"

NSString *const kLoginMd5 = @"md5";
NSString *const kLoginPassword = @"password";
NSString *const kLoginSalt = @"salt";
NSString *const kLoginSha1 = @"sha1";
NSString *const kLoginSha256 = @"sha256";
NSString *const kLoginUsername = @"username";
NSString *const kLoginUuid = @"uuid";

@interface Login ()
@end
@implementation Login




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLoginMd5] isKindOfClass:[NSNull class]]){
		self.md5 = dictionary[kLoginMd5];
	}	
	if(![dictionary[kLoginPassword] isKindOfClass:[NSNull class]]){
		self.password = dictionary[kLoginPassword];
	}	
	if(![dictionary[kLoginSalt] isKindOfClass:[NSNull class]]){
		self.salt = dictionary[kLoginSalt];
	}	
	if(![dictionary[kLoginSha1] isKindOfClass:[NSNull class]]){
		self.sha1 = dictionary[kLoginSha1];
	}	
	if(![dictionary[kLoginSha256] isKindOfClass:[NSNull class]]){
		self.sha256 = dictionary[kLoginSha256];
	}	
	if(![dictionary[kLoginUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kLoginUsername];
	}	
	if(![dictionary[kLoginUuid] isKindOfClass:[NSNull class]]){
		self.uuid = dictionary[kLoginUuid];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.md5 != nil){
		dictionary[kLoginMd5] = self.md5;
	}
	if(self.password != nil){
		dictionary[kLoginPassword] = self.password;
	}
	if(self.salt != nil){
		dictionary[kLoginSalt] = self.salt;
	}
	if(self.sha1 != nil){
		dictionary[kLoginSha1] = self.sha1;
	}
	if(self.sha256 != nil){
		dictionary[kLoginSha256] = self.sha256;
	}
	if(self.username != nil){
		dictionary[kLoginUsername] = self.username;
	}
	if(self.uuid != nil){
		dictionary[kLoginUuid] = self.uuid;
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
	if(self.md5 != nil){
		[aCoder encodeObject:self.md5 forKey:kLoginMd5];
	}
	if(self.password != nil){
		[aCoder encodeObject:self.password forKey:kLoginPassword];
	}
	if(self.salt != nil){
		[aCoder encodeObject:self.salt forKey:kLoginSalt];
	}
	if(self.sha1 != nil){
		[aCoder encodeObject:self.sha1 forKey:kLoginSha1];
	}
	if(self.sha256 != nil){
		[aCoder encodeObject:self.sha256 forKey:kLoginSha256];
	}
	if(self.username != nil){
		[aCoder encodeObject:self.username forKey:kLoginUsername];
	}
	if(self.uuid != nil){
		[aCoder encodeObject:self.uuid forKey:kLoginUuid];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.md5 = [aDecoder decodeObjectForKey:kLoginMd5];
	self.password = [aDecoder decodeObjectForKey:kLoginPassword];
	self.salt = [aDecoder decodeObjectForKey:kLoginSalt];
	self.sha1 = [aDecoder decodeObjectForKey:kLoginSha1];
	self.sha256 = [aDecoder decodeObjectForKey:kLoginSha256];
	self.username = [aDecoder decodeObjectForKey:kLoginUsername];
	self.uuid = [aDecoder decodeObjectForKey:kLoginUuid];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Login *copy = [Login new];

	copy.md5 = [self.md5 copy];
	copy.password = [self.password copy];
	copy.salt = [self.salt copy];
	copy.sha1 = [self.sha1 copy];
	copy.sha256 = [self.sha256 copy];
	copy.username = [self.username copy];
	copy.uuid = [self.uuid copy];

	return copy;
}
@end