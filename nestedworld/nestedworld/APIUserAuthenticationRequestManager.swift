//
//  APIUserAuthenticationRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

class APIUserAuthenticationRequestManager
{
    private var httpRequestManager: HttpRequestManagerProtocol
    
    private var requestRoot: String = ""
    private let appToken: String = "test"
    
    // MARK: ...
    init(httpRequestManager: HttpRequestManagerProtocol, apiRootURL: String)
    {
        self.httpRequestManager = httpRequestManager
        
        self.requestRoot = apiRootURL + "/auth"
    }
    
    // MARK: ...
    func login(email: String, password: String, data: Dictionary<String, AnyObject>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/login/simple"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email,
            "password": password,
            "data": (data != nil ? data! : Dictionary<String, AnyObject>()),
            "app_token": self.appToken,
        ]
        
        self.httpRequestManager.post(url, params: params, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    // MARK: ...
    func logout(token: String, success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/logout"
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    // MARK: ...
    func register(email: String, nickname: String, password: String,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/register"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email,
            "pseudo": nickname,
            "password": password
        ]
        
        self.httpRequestManager.post(url, params: params, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    // MARK: ...
    func resetPassword(email: String,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/resetpassword"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email
        ]
        
        self.httpRequestManager.post(url, params: params, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
}