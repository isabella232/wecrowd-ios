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

@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detailDescription;

@property (nonatomic) CGFloat donationTargetAmount;
@property (nonatomic) CGFloat donationAmount;

@property (nonatomic, strong) NSString* imageURL;
@property (nonatomic, strong) UIImage* image;

@property (nonatomic, strong) NSDate* dateEnd;

@end
