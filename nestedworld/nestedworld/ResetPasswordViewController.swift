//
//  ResetPasswordViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 17/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController
{
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    
    private let apiRequestManager: APIRequestManager = APIRequestManager()
    
    
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
    
    @IBAction func resetPasswordButton(sender: AnyObject)
    {
        if (self.checkParams() == true) {
            let button = sender as! UIButton
            button.enabled = false
            self.apiRequestManager.getUserManager().getAuthenticationManager()
                .resetPassword(self.emailField.text!, success: { (response) -> Void in
                    self.infoLabel.text = "Success"
                    button.enabled = true
                    }, failure: { (error, response) -> Void in
                        self.infoLabel.text = "Failure"
                        button.enabled = true
                })
        }
    }
    
    // MARK: Private functions
    
    private func checkParams() -> Bool
    {
        if (self.emailField.text?.isEmpty == true) {
            return false
        }
        
        return true
    }
}
