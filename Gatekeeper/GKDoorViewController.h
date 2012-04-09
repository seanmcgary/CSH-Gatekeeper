//
//  GKDoorViewController.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKDoorCell.h"

@interface GKDoorViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *statuses;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

- (id) initWithDoorStatuses: (NSMutableArray *)doorStatuses andCreds: (NSString *) username: (NSString *) password;

@end
