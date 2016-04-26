//
//  UserTests.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import XCTest
@testable import nestedworld

class UserTests: XCTestCase
{
    private var errorMessage: String = "[TEST]-[USER]-[ERROR]-"
    
    // MARK: Default value
    private let email: String = "api.test@nestedworld.com"
    private let nickname: String = "nestedworld-test"
    private let gender: String = "male"
    private let birthDate:String = "1942-08-09T12:42:42.6789+00:00"
    private let city: String = "Paris"
    private let background: String = "http://image-background.nestedworld.com"
    private let avatar: String = "http://image-avatar.nestedworld.com"
    private let registerDate: String = "2010-01-27T17:42:42.1234+00:00"
    private let isActive: Bool = true
    
    func testAll()
    {
        self.testEverythingIsOk()
        self.testGender()
        self.testBirthDate()
        self.testCity()
        self.testBackGround()
        self.testAvatar()
    }
    
    func testEverythingIsOk()
    {
        let test = User(email: self.email, nickname: self.nickname,
            gender: self.gender, birthDate: self.birthDate, city: self.city,
            background: self.background, avatar: self.avatar,
            registerDate: self.registerDate, isActive: self.isActive)
        XCTAssertNotNil(test, self.errorMessage + "")
    }
    
    func testGender()
    {
        let testCases: [AnyObject?] = [
            "",         // Empty
            "male",     // Valid
            "Pirate",   // Not existing
            "FEmaLE",   // With upper case
            nil         // Nil
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: value as? String, birthDate: self.birthDate, city: self.city,
                background: self.background, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNotNil(test, self.errorMessage + "[GENDER]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testBirthDate()
    {
        let testCases: [AnyObject?] = [
            "",                                 // Empty
            "2170-08-09T12:42:42.6789+00:00",   // Not happened
            "coucou",                           // Bad
            nil                                 // Nil
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: self.gender, birthDate: value as? String, city: self.city,
                background: self.background, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNotNil(test, self.errorMessage + "[BIRTHDATE]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testCity()
    {
        let testCases: [AnyObject?] = [
            "",         // Empty
            "Lille",    // Existing
            "EIPCity",  // Not existing
            nil         // Nil
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: self.gender, birthDate: self.birthDate, city: value as? String,
                background: self.background, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNotNil(test, self.errorMessage + "[CITY]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testBackGround()
    {
        let testCases: [AnyObject?] = [
            "",                                             // Empty
            "http://image-test-background.nestedworld.com", // Existing
            "http://fake.xxfake-backgroundxx.fake",         // Not existing
            nil                                             // Nil
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: self.gender, birthDate: self.birthDate, city: self.city,
                background: value as? String, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNotNil(test, self.errorMessage + "[BACKGROUND]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testAvatar()
    {
        let testCases: [AnyObject?] = [
            "",                                             // Empty
            "http://image-test-avatar.nestedworld.com",     // Existing
            "http://fake.xxfake-avatarxx.fake",             // Not existing
            nil                                             // Nil
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: self.gender, birthDate: self.birthDate, city: self.city,
                background: self.background, avatar: value as? String,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNotNil(test, self.errorMessage + "[AVATAR]: Test has failed with value: \"\(value)\"")
        }
    }
}