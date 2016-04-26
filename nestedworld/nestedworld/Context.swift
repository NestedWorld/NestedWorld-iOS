//
//  Context.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

class Context
{
    private let apiRequestManager: APIRequestManager = APIRequestManager()
    
    func getAPIRequestManager() -> APIRequestManager
    {
        return self.apiRequestManager;
    }
}