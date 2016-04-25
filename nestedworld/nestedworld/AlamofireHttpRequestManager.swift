//
//  AlamofireHttpRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireHttpRequestManager: HttpRequestManagerProtocol
{
    private let encodingFormat: ParameterEncoding = .JSON
    
    func get(url: String, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        Alamofire.request(.GET, url, parameters: nil, encoding: self.encodingFormat, headers: headers)
            .responseJSON { (response) -> Void in
                switch response.result {
                case .Success:
                    success(response: response.result.value)
                case .Failure:
                    failure(error: response.result.error, response: response.result.value)
                }
        }
    }
    
    func post(url: String, params: Dictionary<String, AnyObject>?, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        Alamofire.request(.POST, url, parameters: params, encoding: self.encodingFormat, headers: headers)
            .responseJSON { (response) -> Void in
                switch response.result {
                case .Success:
                    success(response: response.result.value)
                case .Failure:
                    failure(error: response.result.error, response: response.result.value)
                }
        }
    }
    
    func put(url: String, params: Dictionary<String, AnyObject>?, headers: Dictionary<String, String>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        Alamofire.request(.PUT, url, parameters: params, encoding: self.encodingFormat, headers: headers)
            .responseJSON { (response) -> Void in
                switch response.result {
                case .Success:
                    success(response: response.result.value)
                case .Failure:
                    failure(error: response.result.error, response: response.result.value)
                }
        }
    }
}