//
//  HomePageViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController
{
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var monsterButton: UIButton!
    
    var apiRequestManager: APIRequestManager!
    var sessionUser: User!
    
    private var monsters: [Monster?] = [Monster]()
    
    
    // MARK: ...
    override func viewDidLoad()
    {
        super.viewDidLoad()

        /*
        self.apiRequestManager.getUserManager()
            .userInfo(self.apiRequestManager.getToken(), success: { (response) -> Void in
                let user: Dictionary<String, AnyObject> = response!["user"] as! Dictionary<String, AnyObject>
                
                self.sessionUser = User(email: user["email"] as! String, nickname: user["pseudo"] as! String,
                    gender: user["gender"] as? String, birthDate: user["birth_date"] as? String, city: user["city"] as? String,
                    background: user["background"] as? String, avatar: user["avatar"] as? String,
                    registerDate: user["registered_at"] as! String, isActive: user["is_active"] as! Bool)
                }) { (error, response) -> Void in
                    print("User fail")
        }
        */
    }

    // MARK: ...
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ...
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool
    {
        switch identifier {
        case "homePageToLoginSegue":
            return self.homePageToLoginSegue(identifier, sender: sender)
        case "homePageToMonsterListSegue":
            return self.homePageToMonsterListSegue(identifier, sender: sender)
        default:
            return true
        }
    }
    
    private func homePageToLoginSegue(identifier: String, sender: AnyObject?) -> Bool
    {
        self.apiRequestManager.getUserManager().getAuthenticationManager()
            .logout(self.apiRequestManager.getToken(), success: { (response) -> Void in
                self.apiRequestManager = nil
                self.performSegueWithIdentifier(identifier, sender: sender)
                
                print("Logout OK")
                }, failure: { (error, response) -> Void in
                    
                    print("Logout Fail")
            })
        
        return false
    }
    
    private func homePageToMonsterListSegue(identifier: String, sender: AnyObject?) -> Bool
    {
        self.buttonEnabled(false, monster: false)
        self.apiRequestManager.getMonsterManager().list({ (response) -> Void in
            for monster in response!["monsters"] as! [AnyObject] {
                self.monsters.append(Monster(name: monster["name"] as! String, attack: monster["attack"] as! UInt, defense: monster["defense"] as! UInt, hp: monster["hp"] as! UInt))
            }
            self.performSegueWithIdentifier(identifier, sender: sender)
            }, failure: { (error, response) -> Void in
                print("Monster Fail")
                self.buttonEnabled(true, monster: true)
        })
        
        return false
    }
    
    // MARK: ...
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        switch segue.identifier! {
        case "homePageToMonsterListSegue":
            let next: MonsterTableViewController = segue.destinationViewController as! MonsterTableViewController
            next.monsters = self.monsters
        default:
            break
        }
    }
    
    // MARK: ...
    private func buttonEnabled(logout: Bool, monster: Bool)
    {
        self.logoutButton.enabled = logout
        self.monsterButton.enabled = monster
    }

}
