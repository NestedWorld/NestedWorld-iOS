//
//  LoginViewController.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    apiManager = [[APIRequestManager alloc] init];
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

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    // Register view
    if ([identifier isEqualToString:@"registerSegue"]) {
        return true;
    }
    
    // Home page view
    if ([identifier isEqualToString:@"homePageSegue"]) {
        
        if ([self.emailField.text isEqualToString:@""]) {
            self.infoLabel.text = @"The email field is empty";
        } else if ([self.passwordField.text isEqualToString:@""]) {
            self.infoLabel.text = @"The password field is empty";
        } else {
            NSLog(@"Connection");
            
            self.connectionButton.userInteractionEnabled = NO;
            
            [apiManager loginRequest:self.emailField.text password:self.passwordField.text data:@{} success:^(NSDictionary *response) {
                NSLog(@"Success");
                
                // User init
                
                // [self performSegueWithIdentifier:identifier sender:sender];
                
            } failure:^(NSDictionary *error) {
                NSLog(@"Failure: %@", error);
                self.infoLabel.text = @"Error connection";
                
                self.connectionButton.userInteractionEnabled = YES;
            }];
        }
    }
    return false;
}

@end
