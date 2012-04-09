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
@synthesize popButton;
@synthesize username;
@synthesize password;

- (id) initWithDoor: (NSMutableDictionary *)door
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"GKDoorCell"];
    
    if(self){
        self.door = [[NSMutableDictionary alloc] initWithDictionary:door];
        
        self.textLabel.text = [self.door objectForKey:@"name"];
        
        self.detailTextLabel.text = [self.door objectForKey:@"state"];
        
        popButton = [[GKDoorActionButton alloc] init];
        [popButton addTarget:self action:@selector(popDoor:) forControlEvents:UIControlEventTouchUpInside];
        
        self.accessoryView = popButton;
        //self.userInteractionEnabled = NO;
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

- (void) setUsernameAndPass: (NSString *) username: (NSString *)password
{
    self.username = username;
    self.password = password;
}

- (IBAction)popDoor:(id)sender
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.gatekeeper.csh.rit.edu/pop/%u", [[door objectForKey:@"id"] integerValue]]];
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    NSMutableDictionary *requestHeaders = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"application/json", @"Accept", nil];
    
    
    
    [request setRequestHeaders: requestHeaders];
    [request setPostValue:username forKey:@"username"];
    [request setPostValue:password forKey:@"password"];
    
    // TODO - make this actually check the cert
    [request setValidatesSecureCertificate:NO];
    
    [request setCompletionBlock:^{
        //[spinner stopAnimating];
        NSData *respData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *jsonErr;
        
        NSMutableDictionary *jsonResp = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingMutableContainers error:&jsonErr];
        
        //if([[jsonResp objectForKey:@"success"] integerValue] == 1){
        //}
        
        
    }];
    
    [request setFailedBlock:^{
        //[spinner stopAnimating];
        NSError *err = [request error];
        NSData *respData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *jsonErr;
        
        NSMutableDictionary *jsonResp = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingMutableContainers error:&jsonErr];
        
    }];

    [request startAsynchronous];
}

@end
