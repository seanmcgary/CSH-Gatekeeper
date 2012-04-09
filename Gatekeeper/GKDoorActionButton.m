//
//  GKDoorActionButton.m
//  Gatekeeper
//
//  Created by Sean McGary on 4/9/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GKDoorActionButton.h"

@implementation GKDoorActionButton

- (id) init
{
    self = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        [self setTitle:@"pop" forState:UIControlStateNormal];
        self.frame = CGRectMake(0, 5, 50, 31);
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
