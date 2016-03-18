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
    
    var apiRequestManager: APIRequestManager!
    
    
    // MARK: Override functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool
    {
        switch identifier {
        case "homePageToLoginSegue":
            self.apiRequestManager.logout({ (response) -> Void in
                self.apiRequestManager = nil
                self.performSegueWithIdentifier(identifier, sender: sender)
                print("Logout OK")
                }, failure: { (error, response) -> Void in
                    print("Logout Fail")
            })
            return false
        default:
            return false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        switch segue.identifier {
        default:
            break
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
