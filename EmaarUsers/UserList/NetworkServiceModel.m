//
//  NetworkService.m
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//


#import "NetworkServiceModel.h"


static NSString * const userDataUrl = @"https://randomuser.me/api/?results=100&inc=name,location,email,picture,dob,registered,login";


@implementation NetworkServiceModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }

    return self;
}

- (void)getUserData:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:userDataUrl];

    // Asynchronously
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@",data);
                                                if (error)
                                                    failure(error);
                                                else {
                                                    NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    NSLog(@"%@",json);
                                                    success(json);
                                                }
                                            }];
    [dataTask resume];
}

@end
