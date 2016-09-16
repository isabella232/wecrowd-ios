//
//  WCClient.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/19/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WCCampaignModel, WCCampaignDonationModel;

typedef void(^WCArrayReturnBlock) (NSArray *array, NSError *error);
typedef void(^WCCampaignModelReturnBlock) (WCCampaignModel *campaign, NSError *error);

@interface WCClient : NSObject

+ (void) loginWithUsername:(NSString *) username
                  password:(NSString *) password
           completionBlock:(void (^)(NSDictionary *userInfo, NSError *error)) completionBlock;

+ (void) donateWithDonation:(WCCampaignDonationModel *) donation
            completionBlock:(void (^)(NSString *checkoutID, NSError *error)) completionBlock;

+ (void) fetchAllCampaigns:(WCArrayReturnBlock) completionBlock;

+ (void) fetchAllCampaignsForUser:(NSString *) userID
                        withToken:(NSString *) token
                  completionBlock:(WCArrayReturnBlock) completionBlock;

+ (void) fetchFeaturedCampaigns:(WCArrayReturnBlock) completionBlock;

+ (void) fetchCampaignWithID:(NSString *) campaignID
             completionBlock:(WCCampaignModelReturnBlock) completionBlock;

+ (void) fetchImageWithURLString:(NSString *) URLString
                 completionBlock:(void (^)(UIImage *image, NSError *error)) completionBlock;

@end
