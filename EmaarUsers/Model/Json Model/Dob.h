#import <UIKit/UIKit.h>

@interface Dob : NSObject

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString * date;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end