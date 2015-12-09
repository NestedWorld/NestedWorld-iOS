//
//  RegisterViewController.m
//  NestedWorld
//
//  Created by Jean-Antoine Dupont on 08/12/2015.
//  Copyright © 2015 NestedWorld. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
- (IBAction)registerAction:(id)sender
{
    if ([self.emailField.text isEqualToString:@""]) {
        self.infoLabel.text = @"The email field is empty";
    } else if ([self.nicknameField.text isEqualToString:@""]) {
        self.infoLabel.text = @"The nickname field is empty";
    } else if ([self.passwordField.text isEqualToString:@""]) {
        self.infoLabel.text = @"The password field is empty";
    } else if (![self.passwordField.text isEqualToString:self.confirmationPasswordField.text]) {
        self.infoLabel.text = @"Difference between the password and its confirmation";
    } else {
        NSLog(@"Register");
        
        self.registerButton.userInteractionEnabled = NO;
        
        [apiManager registerRequest:self.emailField.text password:self.passwordField.text nickname:self.nicknameField.text succes:^(NSDictionary *response) {
            NSLog(@"Success");
            self.infoLabel.text = @"You are registered, you can now login";
        } failure:^(NSDictionary *error) {
            NSLog(@"Failure");
            self.infoLabel.text = @"Register error";
            
            self.registerButton.userInteractionEnabled = YES;
        }];
    }
}

@end
