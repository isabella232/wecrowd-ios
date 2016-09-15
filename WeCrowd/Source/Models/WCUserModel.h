//
//  WCUserModel.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Interface

@interface WCUserModel : NSObject

@property (nonatomic, strong) NSString* userID;
@property (nonatomic, strong) NSString* displayName;
@property (nonatomic, strong) NSString* canonicalName;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* token;

- (instancetype) initWithUserID:(NSString *) userID
                    displayName:(NSString *) displayName
                          email:(NSString *) email
                          token:(NSString *) token;

- (void) setUserID:(NSString *)userID
             email:(NSString *)email
             token:(NSString *)token;

@end
