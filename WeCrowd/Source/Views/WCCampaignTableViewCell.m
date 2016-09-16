//
//  WCCampaignTableViewCell.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/26/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCCampaignTableViewCell.h"
#import "WCCampaignModel.h"

@interface WCCampaignTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UIView *contentInsetView;

@end

// Constants.
static NSString* const kCellBackgroundColor = @"0.925 0.925 0.925";
static float const kCellBorderWidth = 0.5f;

@implementation WCCampaignTableViewCell

#pragma mark - Interface

- (void) configureForCampaignHeader:(WCCampaignModel *) model
{
    NSDateFormatter* standardDateFormat = [NSDateFormatter new];
    NSString* timeRemaining;
    UIColor *backgroundColor;
    NSTimeInterval dummyInterval = 60 * 60 * 24 * (rand() % 10 + 1);
    
    // Format the view information
    // Hard code random end date from now since there's no real end day
    [standardDateFormat setDateStyle:NSDateFormatterShortStyle];
    timeRemaining = [NSString stringWithFormat:@"Ends %@", [standardDateFormat stringFromDate:[NSDate dateWithTimeIntervalSinceNow:dummyInterval]]];
    
    // Configure the display information within the view
    self.title.text = model.title;
    self.endDate.text = timeRemaining;
    
    // TODO: Move this logic to the campaign feed controller.
    /*[model fetchImageIfNeededWithCompletion:^(UIImage *image, NSError *error)
    {
        [self.thumbnailImageView setContentMode:UIViewContentModeScaleToFill];
        self.thumbnailImageView.image = image;
    }];*/
    
    // Cell appearance customization
    backgroundColor = [UIColor colorWithCIColor:[CIColor colorWithString:kCellBackgroundColor]];
    
    [self.contentInsetView.layer setBorderWidth:kCellBorderWidth];
    [self.contentInsetView.layer setBorderColor:backgroundColor.CGColor];
    [self.contentView setBackgroundColor:backgroundColor];
}

@end
