//
//  WCCampaignModel.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 9/15/16.
//  Copyright © 2016 WePay. All rights reserved.
//

#import "WCCampaignModel.h"

@implementation WCCampaignModel

- (instancetype) initWithIdentifier:(NSString *) identifier
                              title:(NSString *) title
                               goal:(CGFloat) goal
{
    if (self = [super init])
    {
        self.identifier = identifier;
        self.title = title;
        self.donationTargetAmount = goal;
    }
    
    return self;
}

- (void) copyValuesFromModel:(WCCampaignModel *) model
{
    self.title = model.title;
    self.detailDescription = model.detailDescription;
    self.donationTargetAmount = model.donationTargetAmount;
    self.donationAmount = model.donationAmount;
    self.imageURL = model.imageURL;
    self.image = model.image;
}

@end
