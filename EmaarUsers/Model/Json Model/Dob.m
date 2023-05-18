//
//	Dob.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Dob.h"

NSString *const kDobAge = @"age";
NSString *const kDobDate = @"date";

@interface Dob ()
@end
@implementation Dob




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDobAge] isKindOfClass:[NSNull class]]){
		self.age = [dictionary[kDobAge] integerValue];
	}

	if(![dictionary[kDobDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kDobDate];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDobAge] = @(self.age);
	if(self.date != nil){
		dictionary[kDobDate] = self.date;
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
	[aCoder encodeObject:@(self.age) forKey:kDobAge];	if(self.date != nil){
		[aCoder encodeObject:self.date forKey:kDobDate];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.age = [[aDecoder decodeObjectForKey:kDobAge] integerValue];
	self.date = [aDecoder decodeObjectForKey:kDobDate];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Dob *copy = [Dob new];

	copy.age = self.age;
	copy.date = [self.date copy];

	return copy;
}
@end