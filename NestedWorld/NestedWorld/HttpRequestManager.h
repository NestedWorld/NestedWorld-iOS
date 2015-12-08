//
//  HttpRequestManager.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 07/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpRequestManager : NSObject {
    AFHTTPRequestOperationManager *manager;
}

- (void) addToHeader:(NSDictionary *)params;

- (void) doGetRequest:(NSString *)url
              success:(void (^)(NSDictionary *response))successHandler
              failure:(void (^)(NSDictionary *error))failureHandler
          addToHeader: (NSDictionary*)headerParams;

- (void) doPostRequest:(NSString *)url
               success:(void (^)(NSDictionary *response))successHandler
               failure:(void (^)(NSDictionary *error))failureHandler
                params:(NSDictionary *)params
           addToHeader:(NSDictionary*)headerParams;

@end
