//
//  Extensions.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 24/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

extension String
{
    func toNSDate(format: String) -> NSDate?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.dateFromString(self)
    }
    
    func toUIImage() -> UIImage?
    {
        if (self.isEmpty == false) {
            
        }
        
        return nil
    }
    
    func toGender() -> User.GENDER
    {
        switch self {
        case "male":
            return User.GENDER.MALE
        case "female":
            return User.GENDER.FEMALE
        default:
            return User.GENDER.UNKNOWN
        }
    }
    
    func toMonsterType() -> Monster.TYPE
    {
        switch self {
        case "fire":
            return Monster.TYPE.FIRE
        case "water":
            return Monster.TYPE.WATER
        default:
            return Monster.TYPE.UNKNOWN
        }
    }
}

extension NSDate
{
    func toString(format: String) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.stringFromDate(self)
    }
}
