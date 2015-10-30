//
//  AFNHttpRequest.h
//  testMIdea
//
//  Created by wendy on 15/8/12.
//  Copyright (c) 2015年 pinksun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface AFNHttpRequest : NSObject
+ (void)afnHttpRequestUrl:(NSString *)requestInterface param:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)afnHttpRequestUrl:(NSString *)url param:(NSDictionary *)param constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
