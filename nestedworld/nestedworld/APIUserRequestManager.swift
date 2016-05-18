//
//  APIUserRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 25/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

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
    func profile(token: String, success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
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
    
    func updateProfile(token: String,
        email: String, nickname: String,
        city: String, gender: User.GENDER, birthDate: NSDate,
        avatar: UIImage, background: UIImage,
        isActive: Bool,
        success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/"
        
        let params: Dictionary<String, AnyObject> = [
            "email": email,
            "pseudo": nickname,
            "city": city,
            "gender": gender.toString(),
            "birth_date": birthDate.toString("yyyy-MM-dd'T'HH:mm:ss.SSSZ"),
            "avatar": avatar,
            "background": background,
            "is_active": isActive
        ]
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        self.httpRequestManager.put(url, params: params, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    func addMonster()
    {
        
    }
    
    func getFriends(token: String, success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/friends/"
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        self.httpRequestManager.get(url, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
    
    func addFriend(token: String, success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/friends"
        
        let params: Dictionary<String, AnyObject> = [
            "": ""
        ]
        
        let headers: Dictionary<String, String> = [
            "Authorization": token
        ]
        
        self.httpRequestManager.post(url, params: params, headers: headers, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
}