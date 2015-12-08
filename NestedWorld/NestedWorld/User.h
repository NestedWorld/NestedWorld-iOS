//
//  User.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    NSString *token;
    
    NSString *email;
    NSString *nickname;
    
    NSString *city;
    NSString *gender;
    NSString *birthDate;
    
    BOOL isActive;
    NSString *registerDate;
}

@end
