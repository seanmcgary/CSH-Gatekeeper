//
//  GKPrefHelper.m
//  Gatekeeper
//
//  Created by Sean McGary on 4/9/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GKPrefHelper.h"

@implementation GKPrefHelper

+(id) getUserNameAndPassword
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *usernamePassword = [[NSDictionary alloc] initWithDictionary:[defaults objectForKey:@"GK_usernamePassword"]];
    
    return usernamePassword;
}

+(void) saveUsernameAndPassword:(NSString *) username: (NSString *) password
{
    NSMutableDictionary *usernamePass = [[NSMutableDictionary alloc] init];
    
    [usernamePass setObject:username forKey:@"username"];
    [usernamePass setObject:password forKey:@"password"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:usernamePass forKey:@"GK_usernamePassword"];
    [defaults synchronize];
}

@end
