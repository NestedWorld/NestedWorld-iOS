//
//  LoginViewController.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIRequestManager.h"
#import "User.h"

@interface LoginViewController : UIViewController {
    APIRequestManager *apiManager;
    User *user;
}

// Label
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

// TextField
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

// Button
@property (weak, nonatomic) IBOutlet UIButton *connectionButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;


@end
