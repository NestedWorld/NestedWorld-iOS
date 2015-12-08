//
//  Monster.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "Monster.h"

@implementation Monster

- (id) init:(NSString *)monsterName life:(int)hP attack:(int)aP defense:(int)dP
{
    self = [super init];
    
    if (self != nil) {
        name = monsterName;
        
        healthPoint = hP;
        attackPoint = aP;
        defensePoint = dP;
    }
    
    return self;
}

@end
