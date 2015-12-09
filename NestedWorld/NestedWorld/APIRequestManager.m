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

// MARK: Authentification requests
- (void) registerRequest:(NSString *)email
                password:(NSString *)password
                nickname:(NSString *)nickname
                  succes:(void (^)(NSDictionary *))succesHandler
                 failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/users/auth/register"];
    
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password,
                             @"pseudo": nickname
                             };
    
    [requestManager doPostRequest:url success:^(NSDictionary *response) {
        succesHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } params:params addToHeader:nil];
}

- (void) loginRequest:(NSString *)email
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
                                   @"Authorization": token
                                   };
    
    [requestManager doGetRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } addToHeader:headerParams];
}

- (void) resetPasswordRequest:(NSString *)email
                       success:(void (^)(NSDictionary *))successHandler
                       failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/users/auth/resetpassword"];
    
    NSDictionary *params = @{
                             @"email": email
                             };
    
    [requestManager doPostRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } params:params addToHeader:nil];
}

// MARK: User requests
- (void) userInformationsRequest:(NSString *)token
                         success:(void (^)(NSDictionary *))successHandler
                         failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/users/"];
    
    NSDictionary *headerParams = @{
                                   @"Authorization": token
                                   };
    
    [requestManager doGetRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } addToHeader:headerParams];
}

// MARK: Monster requests
- (void) monsterRequest:(void (^)(NSDictionary *))successHandler
                failure:(void (^)(NSDictionary *))failureHandler
{
    NSString *url = [rootURL stringByAppendingString:@"/monsters/"];
    
    [requestManager doGetRequest:url success:^(NSDictionary *response) {
        successHandler(response);
    } failure:^(NSDictionary *error) {
        failureHandler(error);
    } addToHeader:nil];
}


@end

