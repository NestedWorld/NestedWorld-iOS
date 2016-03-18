//
//  Monster.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import Foundation

class Monster
{
    enum TYPE
    {
        case WATER
        case FIRE
        case UNKNOWN
        
        func toString() -> String
        {
            switch self {
            case .FIRE:
                return "fire"
            case .WATER:
                return "water"
            default:
                return "unknown"
            }
        }
    }
    
    var name: String
    
    var attack: UInt
    var defense: UInt
    var healthPoint: UInt
    
    
    // MARK: ...
    
    init?(name: String, attack: UInt, defense: UInt, hp: UInt)
    {
        self.name = name
        
        self.attack = attack
        self.defense = defense
        self.healthPoint = hp
        
        if (self.checkParams() == false) {
            return nil
        }
    }
    
    
    // MARK: Private functions
    
    private func checkParams() -> Bool
    {
        if (self.name.isEmpty == true) {
            return false
        }
        
        return true
    }
}