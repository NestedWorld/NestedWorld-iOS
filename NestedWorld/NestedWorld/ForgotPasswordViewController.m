//
//  ForgotPasswordViewController.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 09/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: Segue override
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *next = [segue destinationViewController];
    
    [next setValue:apiManager forKey:@"apiManager"];
}

// MARK: Button actions
- (IBAction)forgotPasswordAction:(id)sender
{
    if ([self.emailField.text isEqualToString:@""]) {
        self.infoLabel.text = @"The email field is empty";
    } else {
        NSLog(@"Reset Password");
        
        self.sendRequestButton.userInteractionEnabled = NO;
        
        [apiManager resetPasswordRequest:self.emailField.text success:^(NSDictionary *response) {
            NSLog(@"Success");
            
            self.infoLabel.text = @"Password successfully sent";
            
            self.sendRequestButton.userInteractionEnabled = YES;
        } failure:^(NSDictionary *error) {
            NSLog(@"Failure");
            
            self.infoLabel.text = @"Error forgot password";
            
            self.sendRequestButton.userInteractionEnabled = YES;
        }];
    }
}

@end
