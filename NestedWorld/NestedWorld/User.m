//
//  User.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "User.h"

@implementation User

- (id) init:(NSString *)tokenSession email:(NSString *)userEmail
{
    self = [super init];
    
    if (self != nil) {
        token = tokenSession;
        email = userEmail;
    }
    
    return self;
}

@end