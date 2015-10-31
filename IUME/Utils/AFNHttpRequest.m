//
//  AFNHttpRequest.m
//  testMIdea
//
//  Created by wendy on 15/8/12.
//  Copyright (c) 2015年 pinksun. All rights reserved.
//

#import "AFNHttpRequest.h"
#import "NetworkConfig.h"
@implementation AFNHttpRequest
+ (void)afnHttpRequestUrl:(NSString *)requestInterface param:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
#ifdef TEST
    NSLog(@"发送的报文:%@", param);
    
    NSString *pathName = [requestInterface stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString *path = [[NSBundle mainBundle] pathForResource:pathName ofType:@"json"];
    
    NSError *err;
    NSString *valueStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    
    if (!valueStr) {
        NSLog(@"error: %@", err);
    }
    
    NSDictionary *resultDict = [valueStr objectFromJSONString];
    
    if ([resultDict count]) {
        success(resultDict);
    } else {
        NSError *error = [NSError errorWithDomain:@"模拟报文失败" code:999 userInfo:nil];
        failure(error);
    }
    
#else /* ifdef  TEST */
    NSString *url = [NSString stringWithFormat:@"%@%@", kHttpIPAddress, requestInterface];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
   
    [manager  POST:url
        parameters:param
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               
               if (success) {
                   success(responseObject);
               }
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               failure(error);
               NSLog(@"网络请求失败:%ld", (long)error.code);
           }];
#endif /* ifdef  TEST */
}
+ (void)afnHttpRequestUrl:(NSString *)url param:(NSDictionary *)param constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
#ifdef SSL_Pinning
    /**** SSL Pinning ****/
    NSString *cerPath1 = [[NSBundle mainBundle] pathForResource:@"edge.aia.com" ofType:@"cer"];
    NSData *certData1 = [NSData dataWithContentsOfFile:cerPath1];
    NSString *cerPath2 = [[NSBundle mainBundle] pathForResource:@"IntermediateCA" ofType:@"cer"];
    NSData *certData2 = [NSData dataWithContentsOfFile:cerPath2];
    NSString *cerPath3 = [[NSBundle mainBundle] pathForResource:@"root1" ofType:@"cer"];
    NSData *certData3 = [NSData dataWithContentsOfFile:cerPath3];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    [securityPolicy setAllowInvalidCertificates:NO];
    [securityPolicy setPinnedCertificates:@[certData1, certData2, certData3]];
    
    [manager setSecurityPolicy:securityPolicy];
#endif
    [manager                 POST:url
                       parameters:param
        constructingBodyWithBlock:^(id < AFMultipartFormData > formData) {
            block(formData);
        }
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                              success(responseObject);
                          }
                          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              failure(error);
                          }];
}

@end
