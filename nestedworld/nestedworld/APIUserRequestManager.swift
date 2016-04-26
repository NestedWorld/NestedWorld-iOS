//
//  APIUserRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 25/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

class APIUserRequestManager
{
    private var httpRequestManager: HttpRequestManagerProtocol
    
    private var requestRoot: String = ""
    
    private var authenticationManager: APIUserAuthenticationRequestManager
    
    
    // MARK: ...
    init(httpRequestManager: HttpRequestManagerProtocol, apiRootURL: String)
    {
        self.httpRequestManager = httpRequestManager
        
        self.requestRoot = apiRootURL + "/users"
        
        self.authenticationManager = APIUserAuthenticationRequestManager(httpRequestManager: self.httpRequestManager, apiRootURL: self.requestRoot)
    }
    
    // MARK: ...
    func getAuthenticationManager() -> APIUserAuthenticationRequestManager
    {
        return self.authenticationManager
    }
    
    // MARK: ...
    func userInfo(token: String, success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/"
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    func getProfile(token: String)
    {
        let url: String = self.requestRoot + "/"
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        /*
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
        */
    }
    
    func updateProfile()
    {
        
    }
    
    func getMonsters()
    {
        
    }
    
    func addMonster()
    {
        
    }
    
    func getFriends()
    {
        
    }
    
    func addFriend(nickname: String)
    {
        
    }
}