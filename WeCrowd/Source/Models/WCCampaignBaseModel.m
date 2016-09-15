//
//  WCCampaignBaseModel.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCCampaignBaseModel.h"

#pragma mark - Implementation

@implementation WCCampaignBaseModel

- (instancetype) initWithCampaign:(NSString *) campaign title:(NSString *) title
{
    if (self = [super init])
    {
        self.campaignID = campaign;
        self.title = title;
    }
    
    return self;
}

@end
