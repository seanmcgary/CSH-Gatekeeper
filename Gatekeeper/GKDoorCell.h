//
//  GKDoorCell.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKDoorActionButton.h"
#import "ASIFormDataRequest.h"

@interface GKDoorCell : UITableViewCell

@property (strong, nonatomic) NSMutableDictionary *door;
@property (strong, nonatomic) IBOutlet GKDoorActionButton *popButton;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;


- (id) initWithDoor: (NSMutableDictionary *)door;

- (void) setUsernameAndPass: (NSString *) username: (NSString *)password;

- (IBAction)popDoor:(id)sender;

@end
