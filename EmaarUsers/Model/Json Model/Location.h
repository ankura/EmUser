#import <UIKit/UIKit.h>

@interface Location : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * postcode;
@property (nonatomic, strong) NSString * state;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
