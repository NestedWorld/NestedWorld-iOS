//
//  NSDateExtension.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

extension NSDate
{
    func toString(format: String) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.stringFromDate(self)
    }
}
