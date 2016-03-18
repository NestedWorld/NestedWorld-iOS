//
//  LoginViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private var apiRequestManager: APIRequestManager = APIRequestManager()
    
    
    // MARK: Override functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.infoLabel.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool
    {
        switch identifier {
        case "loginToHomePageSegue":
            if (self.checkParams()) {
                self.apiRequestManager.login(self.emailField.text!, password: self.passwordField.text!, data: nil,
                    success: { (response) -> Void in
                        print("Login Ok")
                        self.performSegueWithIdentifier(identifier, sender: self)
                    }, failure: { (error, response) -> Void in
                        print("Login Fail")
                        self.infoLabel.text = "Connection error"
                })
            }
            return false
        default:
            return false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        switch segue.identifier! {
        case "loginToHomePageSegue":
            let next: HomePageViewController = segue.destinationViewController as! HomePageViewController
            next.apiRequestManager = self.apiRequestManager
        default:
            break
        }
    }
    
    
    // MARK: ...
    
    private func checkParams() -> Bool
    {
        if (self.emailField.text == nil || self.emailField.text?.isEmpty == true) {
            self.infoLabel.text = "The email is missing"
            return false
        }
        
        if (self.passwordField.text == nil || self.passwordField.text?.isEmpty == true) {
            self.infoLabel.text = "The password is missing"
            return false
        }
        
        return true
    }

}
