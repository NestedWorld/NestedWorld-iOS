//
//  APIRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

class APIRequestManager
{
    enum APIRoot
    {
        case DEV
        case PROD
        
        func toString() -> String
        {
            switch self {
            case .DEV:
                return "http://eip-api-dev.kokakiwi.net/v1"
            case .PROD:
                return "http://eip-api.kokakiwi.net/v1"
            }
        }
    }
    
    private let httpRequestManager: HttpRequestManagerProtocol = AlamofireHttpRequestManager()
    
    private let rootURL: APIRoot = .PROD
    private let appToken: String = "test"
    
    private var sessionToken: String = ""
    
    
    // MARK: Authentification functions
    
    func login(email: String, password: String, data: Dictionary<String, AnyObject>?,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/users/auth/login/simple"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email,
            "password": password,
            "data": (data != nil ? data! : Dictionary<String, AnyObject>()),
            "app_token": self.appToken,
        ]
        
        self.httpRequestManager.post(url, params: params, headers: nil, success: { (response) -> Void in
            self.sessionToken = response!["token"] as! String
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    func logout(success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/users/auth/logout"
        
        let headers: Dictionary<String, String> = [
            "Authorization": self.sessionToken
        ]
        
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    func register(email: String, nickname: String, password: String,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/users/auth/register"
        
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
    
    func resetPassword(email: String,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/users/auth/resetpassword"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email
        ]
        
        self.httpRequestManager.post(url, params: params, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    
    // MARK: User requests
    
    func userInfo(success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/users/"
        
        let headers: Dictionary<String, String> = [
            "Authorization": self.sessionToken
        ]
        
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    
    // MARK: Monster requests
    
    func monsterList(success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.rootURL.toString() + "/monsters/"
        
        self.httpRequestManager.get(url, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
}