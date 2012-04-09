//
//  GKLoginViewController.m
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GKLoginViewController.h"

@interface GKLoginViewController ()

@end

@implementation GKLoginViewController

@synthesize username,
            loginButton,
            password,
            statusLabel,
            spinner,
            saveCredentials,
            saveCredentialsLabel;

- (id) init 
{
    self = [super init];
    
    if(self){   
        self.title = @"Gatekeeper Login";
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    username = [[UITextField alloc] initWithFrame:
                CGRectMake(10, 10, (self.view.frame.size.width - 20), 31)];
    
    username.autocapitalizationType = NO;
    username.autocorrectionType = NO;
    [username setPlaceholder:@"username"];
    username.borderStyle = UITextBorderStyleRoundedRect;
    
    password = [[UITextField alloc] initWithFrame:
                CGRectMake(10, 46, (self.view.frame.size.width - 20), 31)];
    
    password.autocorrectionType = NO;
    password.autocapitalizationType = NO;
    password.secureTextEntry = YES;
    [password setPlaceholder:@"password"];
    password.borderStyle = UITextBorderStyleRoundedRect;
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    loginButton.frame = CGRectMake(10, 92, (self.view.frame.size.width - 20), 31);
    
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(submitLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    
    saveCredentialsLabel = [[UILabel alloc] initWithFrame:
                   CGRectMake(10, 133, 120, 31)];
    saveCredentialsLabel.backgroundColor = [UIColor clearColor];
    saveCredentialsLabel.text = @"Save?";
    
    saveCredentials = [[UISwitch alloc] initWithFrame:CGRectMake(130, 133, 60, 31)];
    
    
    statusLabel = [[UILabel alloc] initWithFrame:
                   CGRectMake(10, 158, (self.view.frame.size.width - 20), 31)];
    statusLabel.backgroundColor = [UIColor clearColor];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    spinner.frame = CGRectMake((self.view.frame.size.width - 50) / 2, 168, 50, 50);
    
    
    
    [self.view addSubview:username];
    [self.view addSubview:password];
    [self.view addSubview:loginButton];
    [self.view addSubview:saveCredentialsLabel];
    [self.view addSubview:saveCredentials];
    [self.view addSubview:statusLabel];
    [self.view addSubview:spinner];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)submitLogin:(id)sender
{
    if([[self.username text] length] > 0 && [[self.password text] length] > 0)
    {
        
        NSURL *url = [NSURL URLWithString: @"https://api.gatekeeper.csh.rit.edu/all_doors"];
                      
        
        __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        NSMutableDictionary *requestHeaders = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"application/json", @"Accept", nil];
        
        [request setRequestHeaders: requestHeaders];
        [request setPostValue:username.text forKey:@"username"];
        [request setPostValue:password.text forKey:@"password"];
        
        // TODO - make this actually check the cert
        [request setValidatesSecureCertificate:NO];
        
        [request setCompletionBlock:^{
            [spinner stopAnimating];
            NSData *respData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *jsonErr;
            
            NSMutableDictionary *jsonResp = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingMutableContainers error:&jsonErr];
            
            if([[jsonResp objectForKey:@"success"] integerValue] == 1 && [[[jsonResp objectForKey:@"response"] objectAtIndex:0] objectForKey:@"pop"])
            {
                
                if(self.saveCredentials.on){
                    [GKPrefHelper saveUsernameAndPassword:username.text :password.text];
                }
                
                GKDoorViewController *doorController = [[GKDoorViewController alloc] initWithDoorStatuses:[jsonResp objectForKey:@"response"] andCreds:username.text :password.text];
                
                
                
                [self.navigationController pushViewController:doorController animated:YES];
            }
            else 
            {
                self.statusLabel.text = @"Bad username or password";
            }
                       
            
        }];
        
        [request setFailedBlock:^{
            [spinner stopAnimating];
            NSError *err = [request error];
            NSData *respData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *jsonErr;
            
            NSMutableDictionary *jsonResp = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingMutableContainers error:&jsonErr];
            
            self.statusLabel.text = @"Connection error";
        }];
        [spinner startAnimating];
        [request startAsynchronous];
    }
    else 
    {
        // provide a username and password
        self.statusLabel.text = @"Provide a username and password";
    }
    NSLog(@"login");
}

@end
