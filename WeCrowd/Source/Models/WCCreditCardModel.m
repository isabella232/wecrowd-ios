//
//  WCCreditCardModel.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCCreditCardModel.h"

#pragma mark - Implementation

@implementation WCCreditCardModel

- (instancetype) initWithFirstName:(NSString *) firstName
                          lastName:(NSString *) lastName
                        cardNumber:(NSString *) cardNumber
                         cvvNumber:(NSString *) cvvNumber
                           zipCode:(NSString *) zipCode
                    expirationDate:(NSDate *) expirationDate
{
    if (self = [super init])
    {
        self.firstName = firstName;
        self.lastName = lastName;
        self.fullName = [firstName stringByAppendingString:[NSString stringWithFormat:@" %@", lastName]];
        self.cardNumber = cardNumber;
        self.cvvNumber = cvvNumber;
        self.zipCode = zipCode;
        self.expirationDate = expirationDate;
    }
    
    return self;
}

@end
