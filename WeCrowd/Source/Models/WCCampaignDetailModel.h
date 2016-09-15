//
//  WCCampaignDetailModel.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCCampaignModel.h"

@class UIImage;

@interface WCCampaignDetailModel : WCCampaignModel

- (instancetype) initWithCampaign:(NSString *) campaign
                            title:(NSString *) title
                          endDate:(NSDate *) endDate
                   donationTarget:(CGFloat) donationTarget
                   donationAmount:(CGFloat) donationAmount
                      detailImage:(UIImage *) detailImage
                detailDescription:(NSString *) detailDescription;

@end
