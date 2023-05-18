//
//  NetworkService.h
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//


#import <Foundation/Foundation.h>

@interface NetworkServiceModel : NSObject

- (instancetype)init;

- (void)getUserData:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;

@end
