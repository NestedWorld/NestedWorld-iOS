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
                self.buttonEnabled(false, register: false, resetPassword: false)
                self.apiRequestManager.login(self.emailField.text!, password: self.passwordField.text!, data: nil,
                    success: { (response) -> Void in
                        print("Login Ok")
                        self.performSegueWithIdentifier(identifier, sender: self)
                    }, failure: { (error, response) -> Void in
                        print("Login Fail")
                        self.infoLabel.text = "Connection error"
                        self.buttonEnabled(true, register: true, resetPassword: true)
                })
            }
            return false
        default:
            return true
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
    
    
    // MARK: Private functions
    
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
    
    private func buttonEnabled(connect: Bool, register: Bool, resetPassword: Bool)
    {
        self.connectButton.enabled = connect
        self.registerButton.enabled = register
        self.resetPasswordButton.enabled = resetPassword
    }

}
