//
//  RegisterViewController.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIRequestManager.h"

@interface RegisterViewController : UIViewController {
    APIRequestManager *apiManager;
}

// Label
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

// Text field
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmationPasswordField;

// Button
@property (weak, nonatomic) IBOutlet UIButton *connectionButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

// Button actions
- (IBAction)registerAction:(id)sender;

@end
