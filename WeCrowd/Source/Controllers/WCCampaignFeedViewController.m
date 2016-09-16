//
//  WCCampaignFeedViewController.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/22/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCCampaignFeedViewController.h"
#import "WCCampaignModel.h"
#import "WCLoginManager.h"
#import "WCClient.h"
#import "WCConstants.h"
#import "WCCampaignTableViewCell.h"
#import "WCAlert.h"
#import "WCError.h"

// UITableViewCell identifiers
static NSString* const kCampaignCellReuseIdentifier = @"CampaignCell";

@interface WCCampaignFeedViewController ()

@property (nonatomic, strong, readwrite) NSArray *campaigns;

// TODO: should just pass off the campaign model.
@property (nonatomic, weak, readwrite) NSString *selectedCampaignID;

@property (nonatomic, weak, readwrite) id<CampaignDetailDelegate> delegate;

@end

@implementation WCCampaignFeedViewController

#pragma mark - UIViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self fetchCampaignsWithCompletionCallback:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.tableView.rowHeight = 500;
    }
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"%@: Received memory warning", NSStringFromClass([self class]));
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section
{
    return [self.campaigns count];
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    WCCampaignTableViewCell *cell;
    WCCampaignModel *model;
    
    cell = (WCCampaignTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kCampaignCellReuseIdentifier
                                                                       forIndexPath:indexPath];
    model = [self campaignAtIndexPath:indexPath];
    
    [cell configureForCampaignHeader:model];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath
{
    WCCampaignModel *selectedCampaign = (WCCampaignModel *) [self.campaigns objectAtIndex:indexPath.row];
    
    self.selectedCampaignID = selectedCampaign.identifier;
    
    [self performSegueWithIdentifier:kIBSegueCampaignFeedToCampaignDetail sender:self];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id) sender
{
    if ([segue.identifier isEqualToString:kIBSegueCampaignFeedToCampaignDetail])
    {
        self.delegate = [segue destinationViewController];
        
        [self.delegate campaignFeedViewController:self
                          didSelectCampaignWithID:self.selectedCampaignID];
    }
}

#pragma mark - Helper Methods

- (void) fetchCampaignsWithCompletionCallback:(void (^)(NSError *error)) completion
{
    [WCClient fetchAllCampaigns:^(NSArray *campaigns, NSError *error)
    {
        if (error)
        {
            [self showCampaignFeedError:error];
        }
        else
        {
            if ([WCLoginManager userType] == WCLoginUserPayer)
            {
                self.campaigns = campaigns;
            }
            else
            {
                // Show only an arbitrary 1/3 of the campaigns for the merchant.
                self.campaigns = [campaigns subarrayWithRange:NSMakeRange(0, campaigns.count / 3)];
            }
            
            // Force a refresh of the table since we can't guarantee
            // when the request will finish until this block
            [self.tableView reloadData];
        }
        
        completion(error);
    }];
}

- (WCCampaignModel *) campaignAtIndexPath:(NSIndexPath *) indexPath
{
    return [self.campaigns objectAtIndex:indexPath.row];
}

- (void) showCampaignFeedError:(NSError *) error
{
    NSString *message;
    
    message = [NSString stringWithFormat:@"Could not retrieve the campaigns from the server: %@", message];
    
    [WCAlert showAlertWithOptionFromViewController:self
                                          withTitle:@"Unable to fetch campaigns."
                                            message:message
                                        optionTitle:@"Try Again"
                                   optionCompletion:^{ [self fetchCampaignsWithCompletionCallback:nil]; }
                                    closeCompletion:nil];
}

@end
