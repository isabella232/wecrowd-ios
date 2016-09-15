//
//  WCCreditCardModel.h
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/11/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Interface

@interface WCCreditCardModel : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *cardNumber;
@property (nonatomic, strong) NSString *cvvNumber;
@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSDate *expirationDate;

- (instancetype) initWithFirstName:(NSString *) firstName
                          lastName:(NSString *) lastName
                        cardNumber:(NSString *) cardNumber
                         cvvNumber:(NSString *) cvvNumber
                           zipCode:(NSString *) zipCode
                    expirationDate:(NSDate *) expirationDate;

@end
