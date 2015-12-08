//
//  HttpRequestManager.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 07/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "HttpRequestManager.h"

@implementation HttpRequestManager

- (id) init
{
    self = [super init];
    
    if (self != nil) {
        manager = [AFHTTPRequestOperationManager manager];
        [manager setValue:[AFHTTPRequestSerializer serializer] forKey:@"requestSerializer"];
    }
    
    return self;
}

- (void) addToHeader:(NSDictionary *)params
{
    if (params != nil) {
        for (id key in params) {
            [manager.requestSerializer setValue:[params objectForKey:key] forKey:key];
        }
    }
}

- (void) doGetRequest:(NSString *)url
              success:(void (^)(NSDictionary *))successHandler
              failure:(void (^)(NSDictionary *))failureHandler
          addToHeader:(NSDictionary *)headerParams
{
    [self addToHeader:headerParams];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        successHandler((NSDictionary *)responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        failureHandler((NSDictionary *)[operation valueForKey:@"responseObject"]);
    }];
}

- (void) doPostRequest:(NSString *)url
               success:(void (^)(NSDictionary *))successHandler
               failure:(void (^)(NSDictionary *))failureHandler
                params:(NSDictionary *)params
           addToHeader:(NSDictionary *)headerParams
{
    [self addToHeader:headerParams];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        successHandler((NSDictionary *)responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        failureHandler((NSDictionary *)[operation valueForKey:@"responseObject"]);
    }];
}

@end
