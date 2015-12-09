//
//  Monster.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject {
    NSString *name;
    
    int healthPoint;
    
    int attackPoint;
    int defensePoint;
}

@end
