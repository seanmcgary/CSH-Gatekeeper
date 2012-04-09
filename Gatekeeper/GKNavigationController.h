//
//  GKNavigationController.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKLoginViewController.h"

@interface GKNavigationController : UINavigationController

@property (strong, nonatomic) GKLoginViewController *loginView;

@end
