//
//  UserTestsManager.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

class UserTestsManager
{
    enum TestType
    {
        case NIL
        case NOT_NIL
        
        func get(errorMsgRoot: String) -> UserTestsProtocol
        {
            switch self {
            case .NIL:
                return UserNilTests(errorMsgRoot: errorMsgRoot)
            case .NOT_NIL:
                return UserNotNilTests(errorMsgRoot: errorMsgRoot)
            }
        }
    }
    
    private var errorMessageRoot: String
    
    init(errorMsgRoot: String)
    {
        self.errorMessageRoot = errorMsgRoot + "[USER]: "
    }
    
    func get(testType: UserTestsManager.TestType) -> UserTestsProtocol
    {
        return testType.get(self.errorMessageRoot)
    }
}