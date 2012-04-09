//
//  GKLoginViewController.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "GKDoorViewController.h"
#import "GKPrefHelper.h"

@interface GKLoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UISwitch *saveCredentials;
@property (strong, nonatomic) IBOutlet UILabel *saveCredentialsLabel;

- (id) init;

- (IBAction)submitLogin:(id)sender;


@end
