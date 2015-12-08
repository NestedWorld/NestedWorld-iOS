//
//  APIRequestManager.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestManager.h"

@interface APIRequestManager : NSObject {
    HttpRequestManager *requestManager;
    NSString *rootURL;
    NSString *appToken;
}

- (void) registerRequest:(NSString *)email
                password:(NSString *)password
                nickname:(NSString *)nickname
                  succes:(void (^)(NSDictionary *response))succesHandler
                 failure:(void (^)(NSDictionary *error))failureHandler;

- (void) loginRequest:(NSDictionary *)email
             password:(NSString *)password
                 data:(NSDictionary *)data
              success:(void (^)(NSDictionary *response))successHandler
              failure:(void (^)(NSDictionary *error))failureHandler;

- (void) logoutRequest:(NSString *)token
               success:(void (^)(NSDictionary *))successHandler
               failure:(void (^)(NSDictionary *))failureHandler;

@end
