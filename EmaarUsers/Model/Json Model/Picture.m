//
//	Picture.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Picture.h"

NSString *const kPictureLarge = @"large";
NSString *const kPictureMedium = @"medium";
NSString *const kPictureThumbnail = @"thumbnail";

@interface Picture ()
@end
@implementation Picture




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPictureLarge] isKindOfClass:[NSNull class]]){
		self.large = dictionary[kPictureLarge];
	}	
	if(![dictionary[kPictureMedium] isKindOfClass:[NSNull class]]){
		self.medium = dictionary[kPictureMedium];
	}	
	if(![dictionary[kPictureThumbnail] isKindOfClass:[NSNull class]]){
		self.thumbnail = dictionary[kPictureThumbnail];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.large != nil){
		dictionary[kPictureLarge] = self.large;
	}
	if(self.medium != nil){
		dictionary[kPictureMedium] = self.medium;
	}
	if(self.thumbnail != nil){
		dictionary[kPictureThumbnail] = self.thumbnail;
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
	if(self.large != nil){
		[aCoder encodeObject:self.large forKey:kPictureLarge];
	}
	if(self.medium != nil){
		[aCoder encodeObject:self.medium forKey:kPictureMedium];
	}
	if(self.thumbnail != nil){
		[aCoder encodeObject:self.thumbnail forKey:kPictureThumbnail];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.large = [aDecoder decodeObjectForKey:kPictureLarge];
	self.medium = [aDecoder decodeObjectForKey:kPictureMedium];
	self.thumbnail = [aDecoder decodeObjectForKey:kPictureThumbnail];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Picture *copy = [Picture new];

	copy.large = [self.large copy];
	copy.medium = [self.medium copy];
	copy.thumbnail = [self.thumbnail copy];

	return copy;
}
@end