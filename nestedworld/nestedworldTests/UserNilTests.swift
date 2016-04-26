//
//  UserNilTests.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/04/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import XCTest

class UserNilTests: XCTest, UserTestsProtocol
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
        self.errorMessageRoot = errorMsgRoot + "[NIL]: "
    }
    
    func testAll()
    {
        self.testEmail()
        self.testNickname()
        self.testGender()
        self.testBirthDate()
        self.testCity()
        self.testBackground()
        self.testAvatar()
        self.testRegisterDate()
        self.testIsActive()
        
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
    
    func testEmail()
    {
        let testCases: [AnyObject?] = [
            "",     // Empty
        ]
        
        for value in testCases {
            let test = User(email: value as! String, nickname: self.nickname,
                gender: self.gender, birthDate: self.birthDate, city: self.city,
                background: self.background, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNil(test, self.errorMessageRoot + "[EMAIL]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testNickname()
    {
        let testCases: [AnyObject?] = [
            "",     // Empty
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: value as! String,
                gender: self.gender, birthDate: self.birthDate, city: self.city,
                background: self.background, avatar: self.avatar,
                registerDate: self.registerDate, isActive: self.isActive)
            XCTAssertNil(test, self.errorMessageRoot + "[NICKNAME]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testGender()
    {
        
    }
    
    func testBirthDate()
    {
        
    }
    
    func testCity()
    {
        
    }
    
    func testBackground()
    {
        
    }
    
    func testAvatar()
    {
        
    }
    func testRegisterDate()
    {
        let testCases: [AnyObject?] = [
            "",                                 // Empty
            //"2170-08-09T12:42:42.6789+00:00",   // Not happened
            "coucou",                           // Bad
        ]
        
        for value in testCases {
            let test = User(email: self.email, nickname: self.nickname,
                gender: self.gender, birthDate: self.birthDate, city: self.city,
                background: self.background, avatar: self.avatar,
                registerDate: value as! String, isActive: self.isActive)
            XCTAssertNil(test, self.errorMessageRoot + "[REGISTERDATE]: Test has failed with value: \"\(value)\"")
        }
    }
    
    func testIsActive()
    {
        
    }

}