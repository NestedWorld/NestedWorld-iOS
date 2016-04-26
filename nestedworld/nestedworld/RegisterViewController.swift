//
//  RegisterViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController
{
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!

    
    private let apiRequestManager = APIRequestManager()
    
    
    // MARK: Override functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.infoLabel.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Action functions
    
    @IBAction func registerButton(sender: AnyObject)
    {
        if (self.checkParams() == true) {
            let button = sender as! UIButton
            button.enabled = false
            
            self.infoLabel.text = ""
            
            self.apiRequestManager.getUserManager().getAuthenticationManager()
                .register(self.emailField.text!, nickname: self.nicknameField.text!, password: self.passwordField.text!,
                    success: { (response) -> Void in
                        self.infoLabel.text = "You are now registered"
                    }, failure: { (error, response) -> Void in
                        self.infoLabel.text = self.printError(error, response: response)
                        button.enabled = true
                })
        }
    }
    
    // MARK: Private functions
    
    private func checkParams() -> Bool
    {
        if (self.emailField == nil || self.emailField.text?.isEmpty == true) {
            self.infoLabel.text = "Email field is missing"
            return false
        }
        
        if (self.nicknameField == nil || self.nicknameField.text?.isEmpty == true) {
            self.infoLabel.text = "Nickname field is missing"
            return false
        }
        
        if (self.nicknameField.text?.characters.count < 3) {
            self.infoLabel.text = "Nickname need more characters"
            return false
        }
        
        if (self.passwordField == nil || self.passwordField.text?.isEmpty == true) {
            self.infoLabel.text = "Password field is missing"
            return false
        }
        
        if (self.passwordField.text != self.confirmPasswordField.text) {
            self.infoLabel.text = "Password field and its confirmation field are not the same"
            return false
        }
        
        return true
    }
    
    private func printError(error: NSError?, response: AnyObject?) -> String
    {
        return "Error connection"
    }
}
