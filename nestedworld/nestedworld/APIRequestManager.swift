//
//  APIRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

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
    
    private let rootURL: APIRoot = .PROD
    private var sessionToken: String = ""

    private var userManager: APIUserRequestManager
    private var monsterManager: APIMonsterRequestManager
    
    private let httpRequestManager: HttpRequestManagerProtocol = AlamofireHttpRequestManager()
    
    // MARK: ...
    init()
    {
        self.userManager = APIUserRequestManager(httpRequestManager: self.httpRequestManager, apiRootURL: self.rootURL.toString())
        self.monsterManager = APIMonsterRequestManager(httpRequestManager: self.httpRequestManager, apiRootURL: self.rootURL.toString())
    }
    
    // MARK: ...
    func setToken(token: String)
    {
        self.sessionToken = token
    }
    
    // MARK: ...
    func getToken() -> String
    {
        return self.sessionToken
    }
    
    // MARK: ...
    func getUserManager() -> APIUserRequestManager
    {
        return self.userManager
    }
    
    // MARK: ...
    func getMonsterManager() -> APIMonsterRequestManager
    {
        return self.monsterManager
    }
}