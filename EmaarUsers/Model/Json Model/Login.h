#import <UIKit/UIKit.h>

@interface Login : NSObject

@property (nonatomic, strong) NSString * md5;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * salt;
@property (nonatomic, strong) NSString * sha1;
@property (nonatomic, strong) NSString * sha256;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * uuid;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end