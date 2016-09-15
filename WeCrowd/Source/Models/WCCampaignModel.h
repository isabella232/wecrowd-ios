//
//  WCCampaignModel.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 9/15/16.
//  Copyright © 2016 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WCCampaignModel : NSObject

@property (nonatomic, strong) NSString* campaignID;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detailDescription;

@property (nonatomic) CGFloat donationTargetAmount;
@property (nonatomic) CGFloat donationAmount;

@property (nonatomic, strong) NSString* thumbnailImageURLString;
@property (nonatomic, strong) UIImage* thumbnailImage;

@property (nonatomic, strong) NSDate* dateEnd;

@end
