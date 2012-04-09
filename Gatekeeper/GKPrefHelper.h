//
//  GKPrefHelper.h
//  Gatekeeper
//
//  Created by Sean McGary on 4/9/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKPrefHelper : NSObject

+(id) getUserNameAndPassword;

+(void) saveUsernameAndPassword:(NSString *) username: (NSString *) password;

@end
