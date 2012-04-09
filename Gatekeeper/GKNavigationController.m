//
//  GKNavigationController.m
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GKNavigationController.h"

@interface GKNavigationController ()

@end

@implementation GKNavigationController

@synthesize loginView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        loginView = [[GKLoginViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self pushViewController:loginView animated:NO];
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

@end
