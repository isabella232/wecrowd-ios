//
//  WCCampaignHeaderModel.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCCampaignHeaderModel.h"
#import "WCClient.h"

#pragma mark - Implementation

@implementation WCCampaignHeaderModel

- (instancetype) initWithCampaign:(NSString *) campaign
                            title:(NSString *) title
                   imageURLString:(NSString *) imageURLString
{
    if (self = [super init])
    {
        self.identifier = campaign;
        self.title = title;
        self.imageURL = imageURLString;
    }
    
    return self;
}

- (void) fetchImageIfNeededWithCompletion:(void (^)(UIImage *image, NSError *error)) completion
{
    // Only fetch the image if one isn't already stored
    if (!self.image)
    {
        [WCClient fetchImageWithURLString:self.imageURL
                          completionBlock:^(UIImage *image, NSError *error)
        {
            self.image = image;
            completion(image, error);
        }];
    }
    else
    {
        completion(self.image, nil);
    }
}

@end
