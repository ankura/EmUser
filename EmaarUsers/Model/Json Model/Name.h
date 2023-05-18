#import <UIKit/UIKit.h>

@interface Name : NSObject

@property (nonatomic, strong) NSString * first;
@property (nonatomic, strong) NSString * last;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end