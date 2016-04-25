//
//  HttpRequestManagerProtocol.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

protocol HttpRequestManagerProtocol
{
    func get(url: String, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    
    func post(url: String, params: Dictionary<String, AnyObject>?, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    
    func put(url: String, params: Dictionary<String, AnyObject>?, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void);
}