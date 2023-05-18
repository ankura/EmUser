//
//	Name.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Name.h"

NSString *const kNameFirst = @"first";
NSString *const kNameLast = @"last";
NSString *const kNameTitle = @"title";

@interface Name ()
@end
@implementation Name




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kNameFirst] isKindOfClass:[NSNull class]]){
		self.first = dictionary[kNameFirst];
	}	
	if(![dictionary[kNameLast] isKindOfClass:[NSNull class]]){
		self.last = dictionary[kNameLast];
	}	
	if(![dictionary[kNameTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kNameTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.first != nil){
		dictionary[kNameFirst] = self.first;
	}
	if(self.last != nil){
		dictionary[kNameLast] = self.last;
	}
	if(self.title != nil){
		dictionary[kNameTitle] = self.title;
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
	if(self.first != nil){
		[aCoder encodeObject:self.first forKey:kNameFirst];
	}
	if(self.last != nil){
		[aCoder encodeObject:self.last forKey:kNameLast];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kNameTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.first = [aDecoder decodeObjectForKey:kNameFirst];
	self.last = [aDecoder decodeObjectForKey:kNameLast];
	self.title = [aDecoder decodeObjectForKey:kNameTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Name *copy = [Name new];

	copy.first = [self.first copy];
	copy.last = [self.last copy];
	copy.title = [self.title copy];

	return copy;
}
@end