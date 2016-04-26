//
//  UserTests.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import XCTest

class UserNotNilTests: UserTestsProtocol
{
    private var errorMessageRoot: String
    
    private let email: String = "test@nestedworld.com"
    private let nickname: String = "test"
    private let gender: String = "male"
    private let birthDate:String = "1942-08-09T12:42:42.6789+00:00"
    private let city: String = "Paris"
    private let background: String = "http://background-test.nestedworld.com"
    private let avatar: String = "http://avatar-test.nestedworld.com"
    private let registerDate: String = "2010-01-27T17:42:42.1234+00:00"
    private let isActive: Bool = true
    
    init(errorMsgRoot: String)
    {
        self.errorMessageRoot = errorMsgRoot + "[NOT NIL]: "
    }
    
    func testAll()
    {
        self.testEverythingIsOk()
        self.testEmail()
        self.testNickname()
        self.testGender()
        self.testBirthDate()
        self.testCity()
        self.testBackground()
        self.testAvatar()
        self.testRegisterDate()
        self.testIsActive()
    }
    
    func testEverythingIsOk()
    {
        let test = User(email: self.email, nickname: self.nickname,
            gender: self.gender, birthDate: self.birthDate, city: self.city,
            background: self.background, avatar: self.avatar,
            registerDate: self.registerDate, isActive: self.isActive)
        XCTAssertNotNil(test, self.errorMessageRoot + "..")
    }
    
    func testEmail()
    {
    }
    
    func testNickname()
    {
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
            XCTAssertNotNil(test, self.errorMessageRoot + "[GENDER]: Test has failed with value: \"\(value)\"")
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
            XCTAssertNotNil(test, self.errorMessageRoot + "[BIRTHDATE]: Test has failed with value: \"\(value)\"")
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
            XCTAssertNotNil(test, self.errorMessageRoot + "[CITY]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testBackground()
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
            XCTAssertNotNil(test, self.errorMessageRoot + "[BACKGROUND]: Test has failed with value: \"\(value)\"")
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
            XCTAssertNotNil(test, self.errorMessageRoot + "[AVATAR]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testRegisterDate()
    {
    }
    
    func testIsActive()
    {
    }
}