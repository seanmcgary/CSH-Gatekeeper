//
//  GKDoorCell.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKDoorCell : UITableViewCell

@property (strong, nonatomic) NSMutableDictionary *door;

- (id) initWithDoor: (NSMutableDictionary *)door;

@end
