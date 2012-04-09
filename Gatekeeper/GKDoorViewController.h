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

- (id) initWithDoorStatuses: (NSMutableArray *)doorStatuses;

@end
