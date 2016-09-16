//
//  WCUserModel.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCUserModel.h"

#pragma mark - Implementation

@implementation WCUserModel

#pragma mark - Initialization

- (instancetype) initWithUserID:(NSString *) userID
                    displayName:(NSString *) displayName
                          email:(NSString *) email
                          token:(NSString *) token
{
    if (self = [super init])
    {
        self.userID = userID;
        self.displayName = displayName;
        self.canonicalName = [displayName lowercaseString];
        self.email = email;
        self.token = token;
    }
    
    return self;
}

- (void) setUserID:(NSString *)userID
             email:(NSString *)email
             token:(NSString *)token
{
    self.userID = userID;
    self.email = email;
    self.token = token;
}

@end
