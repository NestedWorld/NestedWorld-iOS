//
//  User.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class User
{
    enum GENDER
    {
        case MALE
        case FEMALE
        case UNKNOWN
        
        func toString() -> String
        {
            switch self {
            case .MALE:
                return "male"
            case .FEMALE:
                return "female"
            default:
                return "unknown"
            }
        }
    }
    
    var email: String
    var nickname: String
    
    var gender: GENDER
    var birthday: NSDate?
    var city: String?
    
    var background: UIImage?
    var picture: UIImage?
    
    var register: NSDate?
    var active: Bool
    
    private let nilToString = {(value: String?) -> String in
        return (value == nil ? "" : value!)
    }
    
    // MARK: Initialization function
    
    init?(email: String, nickname: String, gender: String?, birthDate: String?, city: String?, background: String?, avatar: String?, registerDate: String, isActive: Bool)
    {
        self.email = email
        self.nickname = nickname
        
        self.gender = self.nilToString(gender).toGender()
        self.birthday = self.nilToString(birthDate).toNSDate("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        self.city = city
        
        self.background = self.nilToString(background).toUIImage()
        self.picture = self.nilToString(avatar).toUIImage()
        
        self.register = self.nilToString(registerDate).toNSDate("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        self.active = isActive
        
        if (self.checkParams() == false) {
            return nil
        }
    }
    
    
    // MARK: Private functions
    
    private func checkParams() -> Bool
    {
        if (self.email.isEmpty == true) {
            return false
        }
        
        if (self.nickname.isEmpty == true) {
            return false
        }
        
        if (self.register == nil) {
            return false
        }
        
        if (self.active == false) {
            return false
        }
        
        return true
    }
    
}