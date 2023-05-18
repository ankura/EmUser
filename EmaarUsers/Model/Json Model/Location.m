//
//	Location.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Location.h"

NSString *const kLocationCity = @"city";
NSString *const kLocationCountry = @"country";
NSString *const kLocationPostcode = @"postcode";
NSString *const kLocationState = @"state";

@interface Location ()
@end
@implementation Location




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLocationCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kLocationCity];
	}	
	

	if(![dictionary[kLocationCountry] isKindOfClass:[NSNull class]]){
		self.country = dictionary[kLocationCountry];
	}	
	if(![dictionary[kLocationPostcode] isKindOfClass:[NSNull class]]){
        if([dictionary[kLocationPostcode] isKindOfClass:[NSString class]]) {
            self.postcode = dictionary[kLocationPostcode];
        } else {
            self.postcode = [NSString stringWithFormat:@"%@",dictionary[kLocationPostcode]];
        }
	}	
	if(![dictionary[kLocationState] isKindOfClass:[NSNull class]]){
		self.state = dictionary[kLocationState];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.city != nil){
		dictionary[kLocationCity] = self.city;
	}
	if(self.country != nil){
		dictionary[kLocationCountry] = self.country;
	}
	if(self.postcode != nil){
		dictionary[kLocationPostcode] = self.postcode;
	}
	if(self.state != nil){
		dictionary[kLocationState] = self.state;
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
	if(self.city != nil){
		[aCoder encodeObject:self.city forKey:kLocationCity];
	}
	if(self.country != nil){
		[aCoder encodeObject:self.country forKey:kLocationCountry];
	}
	if(self.postcode != nil){
		[aCoder encodeObject:self.postcode forKey:kLocationPostcode];
	}
	if(self.state != nil){
		[aCoder encodeObject:self.state forKey:kLocationState];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.city = [aDecoder decodeObjectForKey:kLocationCity];
	self.country = [aDecoder decodeObjectForKey:kLocationCountry];
	self.postcode = [aDecoder decodeObjectForKey:kLocationPostcode];
	self.state = [aDecoder decodeObjectForKey:kLocationState];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Location *copy = [Location new];

	copy.city = [self.city copy];
	copy.country = [self.country copy];
	copy.postcode = [self.postcode copy];
	copy.state = [self.state copy];

	return copy;
}
@end
