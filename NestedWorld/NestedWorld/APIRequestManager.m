//
//  APIRequestManager.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "APIRequestManager.h"

@implementation APIRequestManager

- (id) init
{
    self = [super init];
    
    if (self != nil) {
        requestManager = [[HttpRequestManager alloc] init];
        
        rootURL = @"http://eip-api.kokakiwi.net:80/v1";
        appToken = @"test";
    }
    
    return self;
}

- (void) registerRequest:(NSString *)email
                password:(NSString *)password
                nickname:(NSString *)nickname
                  succes:(void (^)(NSDictionary *))succesHandler
                 failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/user/auth/register"];
    
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password,
                             @"nickname": nickname
                             };
    
    [requestManager doPostRequest:url success:^(NSDictionary *response) {
        succesHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } params:params addToHeader:nil];
}

- (void) loginRequest:(NSDictionary *)email
             password:(NSString *)password
                 data:(NSDictionary *)data
              success:(void (^)(NSDictionary *))successHandler
              failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/users/auth/login/simple"];
    
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password,
                             @"data": data,
                             @"app_token": appToken
                             };
    
    [requestManager doPostRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } params:params addToHeader:nil];
    
}

- (void) logoutRequest:(NSString *)token
               success:(void (^)(NSDictionary *))successHandler
               failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/users/auth/logout"];
    
    NSDictionary *headerParams = @{
                                   @"token": token
                                   };
    
    [requestManager doGetRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } addToHeader:headerParams];
}

@end
