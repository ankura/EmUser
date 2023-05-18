#import <UIKit/UIKit.h>

@interface Picture : NSObject

@property (nonatomic, strong) NSString * large;
@property (nonatomic, strong) NSString * medium;
@property (nonatomic, strong) NSString * thumbnail;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end