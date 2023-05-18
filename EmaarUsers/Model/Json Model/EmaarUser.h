#import <UIKit/UIKit.h>
#import "Dob.h"
#import "Location.h"
#import "Login.h"
#import "Name.h"
#import "Picture.h"
#import "Dob.h"

@interface EmaarUser : NSObject

@property (nonatomic, strong) Dob * dob;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) Location * location;
@property (nonatomic, strong) Login * login;
@property (nonatomic, strong) Name * name;
@property (nonatomic, strong) Picture * picture;
@property (nonatomic, strong) Dob * registered;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end