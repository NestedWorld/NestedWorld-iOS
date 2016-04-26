//
//  APIMonsterRequestManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

class APIMonsterRequestManager
{
    private var httpRequestManager: HttpRequestManagerProtocol
    
    private var requestRoot: String = ""
    
    // MARK: ...
    init(httpRequestManager: HttpRequestManagerProtocol, apiRootURL: String)
    {
        self.httpRequestManager = httpRequestManager
        
        self.requestRoot = apiRootURL + "/monsters"
    }
    
    // MARK: ...
    func list(success: (response: AnyObject?) -> Void, failure: (error: NSError?, response: AnyObject?) -> Void)
    {
        let url: String = self.requestRoot + "/"
        
        self.httpRequestManager.get(url, headers: nil, success: { (response) -> Void in
            success(response: response)
            }) { (error, response) -> Void in
                failure(error: error, response: response)
        }
    }
}