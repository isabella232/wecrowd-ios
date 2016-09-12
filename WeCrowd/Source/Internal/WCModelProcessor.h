//
//  WCModelProcessor.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/25/15.
//  This class takes generic data and turns it into wecrowd-specific models. For instance,
//  a web request might return a JSON object that gets turned into NSBlahDataStructure.
//  This takes NSBlahDataStructure and outputs a wecrowd model for use in the app.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WCModelProcessorCompletion) (id model, NSError *error);

@class WCCampaignDetailModel, WCCreditCardModel;

@interface WCModelProcessor : NSObject

// Returns array of campaign models.
+ (NSArray *) createProcessedArrayForCampaigns:(NSArray *) campaigns;

+ (void) createCampaignDetailFromDictionary:(NSDictionary *) dictionary
                                 completion:(WCModelProcessorCompletion) completion;

+ (WCCreditCardModel *) createCreditCardModelFromFirstName:(NSString *) firstName
                                                  lastName:(NSString *) lastName
                                                cardNumber:(NSString *) cardNumber
                                                       cvv:(NSString *) cvv
                                                   zipCode:(NSString *) zipCode
                                           expirationMonth:(NSString *) expirationMonth
                                            expirationYear:(NSString *) expirationYear;

@end
