//
//  WCModelProcessor.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/25/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCModelProcessor.h"
#import <UIKit/UIKit.h>
#import "WCConstants.h"

#import "WCCampaignModel.h"
#import "WCCreditCardModel.h"
#import "WCClient.h"

@implementation WCModelProcessor


+ (NSArray *) createProcessedArrayForCampaigns:(NSArray *) campaigns
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[campaigns count]];
    
    // Process the list of dictionaries
    for (int i = 0; i < [campaigns count]; ++i)
    {
        NSDictionary *campaign;
        NSString *campaignID, *campaignTitle;
        NSNumber *goalObject;
        CGFloat campaignGoal;
        
        campaign = campaigns[i];
        
        campaignID = [[campaign objectForKey:kAPICampaignIDKey] stringValue];
        campaignTitle = [campaign objectForKey:kAPICampaignNameKey];
        
        goalObject = [campaign objectForKey:kAPICampaignGoalKey];
        campaignGoal = [goalObject floatValue];
        
        array[i] = [[WCCampaignModel alloc] initWithIdentifier:campaignID
                                                         title:campaignTitle
                                                          goal:campaignGoal];
    }
    
    return array;
}

+ (WCCampaignModel *) createCampaignDetailFromDictionary:(NSDictionary *) dictionary
{
    WCCampaignModel *detailModel;
    CGFloat donationAmount, donationTarget;
    NSString *imageURLString, *campaignID, *campaignTitle, *description;
    NSNumber* extractedNumber;
    
    // Nasty cast + conversion to get the model values.
    extractedNumber = ((NSNumber *) [dictionary objectForKey:kAPICampaignGoalKey]);
    donationTarget = [extractedNumber floatValue];
    
    extractedNumber = ((NSNumber *) [dictionary objectForKey:kAPICampaignProgressKey]);
    donationAmount = [extractedNumber floatValue];
    
    imageURLString = [dictionary objectForKey:kAPICampaignImageURLKey];
    
    campaignTitle = [dictionary objectForKey:kAPICampaignNameKey];
    campaignID = [[dictionary objectForKey:kAPICampaignIDKey] stringValue];
    description = [dictionary objectForKey:kAPICampaignDescriptionKey];
    
    detailModel = [[WCCampaignModel alloc] initWithIdentifier:campaignID
                                                        title:campaignTitle
                                                         goal:donationTarget];
    detailModel.donationTargetAmount = donationTarget;
    detailModel.donationAmount = donationAmount;
    detailModel.detailDescription = description;
    detailModel.imageURL = imageURLString;
    
    return detailModel;
}

+ (WCCreditCardModel *) createCreditCardModelFromFirstName:(NSString *) firstName
                                                  lastName:(NSString *) lastName
                                                cardNumber:(NSString *) cardNumber
                                                       cvv:(NSString *) cvv
                                                   zipCode:(NSString *) zipCode
                                           expirationMonth:(NSString *) expirationMonth
                                            expirationYear:(NSString *) expirationYear
{
    // Objects to extract the date from the given fields
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    NSDate *expiration;
    
    dateComponents.month = [expirationMonth integerValue];
    dateComponents.year = [expirationYear integerValue];
    
    expiration = [calendar dateFromComponents:dateComponents];
    
    return [[WCCreditCardModel alloc] initWithFirstName:firstName
                                               lastName:lastName
                                             cardNumber:cardNumber
                                              cvvNumber:cvv
                                                zipCode:zipCode
                                         expirationDate:expiration];
}

@end
