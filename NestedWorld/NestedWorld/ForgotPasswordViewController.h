//
//  ForgotPasswordViewController.h
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 09/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIRequestManager.h"

@interface ForgotPasswordViewController : UIViewController {
    APIRequestManager *apiManager;
}

// Label
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

// Text field
@property (weak, nonatomic) IBOutlet UITextField *emailField;

// Button
@property (weak, nonatomic) IBOutlet UIButton *sendRequestButton;
@property (weak, nonatomic) IBOutlet UIButton *connetionButton;

// Button actions
- (IBAction)forgotPasswordAction:(id)sender;


@end
