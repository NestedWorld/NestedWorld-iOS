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
    
    // MARK: Not nill functions
    
    func testUserNotNil()
    {
        // Everything is ok
        let test_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_1, "Fail at testUserNotNil -> test_1 \"Everything is ok\"")
        
        // Empty / Bad / Nil gender
        let test_2_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_2_0, "Fail at testUserNotNil -> test_2_0 \"Empty gender\"")
        
        let test_2_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_2_1, "Fail at testUserNotNil -> test_2_1 \"Bad gender\"")
        
        let test_2_2 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: nil, birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_2_2, "Fail at testUserNotNil -> test_2_2 \"Nil gender\"")
        
        // Empty / Bad / Nil birthDate
        let test_3_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_3_0, "Fail at testUserNotNil -> test_3_0 \"Empty birthdate\"")
        
        let test_3_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "2170-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_3_1, "Fail at testUserNotNil -> test_3_1 \"Bad birthdate\"")
        
        let test_3_2 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: nil, city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_3_2, "Fail at testUserNotNil -> test_3_2 \"Nil birthdate\"")
        
        // Empty / Bad / Nil city
        let test_4_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_4_0, "Fail at testUserNotNil -> test_4_0 \"Empty city\"")
        
        let test_4_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_4_1, "Fail at testUserNotNil -> test_4_1 \"Bad city\"")
        
        let test_4_2 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: nil,
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_4_2, "Fail at testUserNotNil -> test_4_2 \"Nil city\"")
        
        // Empty / Bad / Nil background
        let test_5_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_5_0, "Fail at testUserNotNil -> test_5_0 \"Empty background\"")
        
        let test_5_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background-wtf.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_5_1, "Fail at testUserNotNil -> test_5_1 \"Bad background\"")
        
        let test_5_2 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: nil, avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_5_2, "Fail at testUserNotNil -> test_5_2 \"Nil background\"")
        
        // Empty / Bad / Nil avatar
        let test_6_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_6_0, "Fail at testUserNotNil -> test_6_0 \"Empty avatar\"")
        
        let test_6_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld-wtf.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_6_1, "Fail at testUserNotNil -> test_6_1 \"Bad avatar\"")
        
        let test_6_2 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "ermafrodite", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: nil,
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNotNil(test_6_2, "Fail at testUserNotNil -> test_6_0 \"Nil avatar\"")
    }
    
    func testMonsterNotNil()
    {
        // Everything is ok
        let test_1 = Monster(name: "Female", attack: 4, defense: 2, hp: 10)
        XCTAssertNotNil(test_1, "Fail at testMonsterNotNil -> test_1 \"Everything is ok\"")
    }
    
    func testLocationNotNil()
    {
        
    }
    
    
    // MARK: Nill functions
    
    func testUserNil()
    {
        // Empty email
        let test_1 = User(email: "", nickname: "NestWorld",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNil(test_1, "Fail at testUserNil -> test_1 \"Empty email\"")
        
        // Empty nickname
        let test_2 = User(email: "nested.world@epitech.eu", nickname: "",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: true)
        XCTAssertNil(test_2, "Fail at testUserNil -> test_2 \"Empty nickname\"")
        
        // Empty / Bad registerDate
        let test_3_0 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "", isActive: true)
        XCTAssertNil(test_3_0, "Fail at testUserNil -> test_3_0 \"Empty registerDate\"")
        
        let test_3_1 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27", isActive: false)
        XCTAssertNil(test_3_1, "Fail at testUserNil -> test_3_1 \"Bad registerDate\"")
        
        // False isActive
        let test_4 = User(email: "nested.world@epitech.eu", nickname: "NestWorld",
            gender: "male", birthDate: "1942-08-09T12:42:42.6789+00:00", city: "Eipcity",
            background: "http://image-background.nestedworld.com", avatar: "http://image-avatar.nestedworld.com",
            registerDate: "2010-01-27T17:42:42.1234+00:00", isActive: false)
        XCTAssertNil(test_4, "Fail at testUserNil -> test_4 \"False isActive\"")
    }
    
    func testMonsterNil()
    {
        // Empty Name
        let test_1 = Monster(name: "", attack: 0, defense: 0, hp: 0)
        XCTAssertNil(test_1, "Fail at testMonsterNil -> test_1 \"Empty name\"")
    }
    
    func testLocationNil()
    {
        
    }
    
}
