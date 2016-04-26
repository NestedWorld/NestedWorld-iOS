//
//  nestedworldTests.swift
//  nestedworldTests
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import XCTest
@testable import nestedworld

class nestedworldTests: XCTestCase
{
    private let user: UserTestsManager = UserTestsManager(errorMsgRoot: "[ERROR]: [TEST]: ")
    // MARK: Not nill functions
    
    func testNotNill()
    {
        self.user.get(UserTestsManager.TestType.NOT_NIL).testAll()
    }
    
    func testNill()
    {
        self.user.get(UserTestsManager.TestType.NIL).testAll()
    }
    
    
    
    // MARK: Changes
    func testMonsterNotNil()
    {
        // Everything is ok
        let test_1 = Monster(name: "Female", attack: 4, defense: 2, hp: 10)
        XCTAssertNotNil(test_1, "Fail at testMonsterNotNil -> test_1 \"Everything is ok\"")
    }
    
    func testMonsterNil()
    {
        // Empty Name
        let test_1 = Monster(name: "", attack: 0, defense: 0, hp: 0)
        XCTAssertNil(test_1, "Fail at testMonsterNil -> test_1 \"Empty name\"")
    }
}
