//
//  GKDoorCell.m
//  Gatekeeper
//
//  Created by Sean McGary on 4/8/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GKDoorCell.h"

@implementation GKDoorCell

@synthesize door;

- (id) initWithDoor: (NSMutableDictionary *)door
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"GKDoorCell"];
    
    if(self){
        self.door = [[NSMutableDictionary alloc] initWithDictionary:door];
        
        self.textLabel.text = [self.door objectForKey:@"name"];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
