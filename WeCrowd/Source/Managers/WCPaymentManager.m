//
//  WCPaymentManager.m
//  WeCrowd
//
//  Created by Zach Vega-Perkins on 6/30/15.
//  Copyright (c) 2015 WePay. All rights reserved.
//

#import "WCPaymentManager.h"
#import "WCCreditCardModel.h"

@interface WCPaymentManager ()

@property (nonatomic, strong, readwrite) WePay *wepay;

@end

static NSString* const kClientID = @"116876";

@implementation WCPaymentManager

#pragma mark - Class Methods

+ (instancetype) sharedInstance
{
    static WCPaymentManager *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,
                  ^{
                        WPConfig *config;
                        
                        // Use the example app client ID suitable for testing
                        config = [[WPConfig alloc] initWithClientId:kClientID
                                                        environment:kWPEnvironmentStage];
                        instance = [WCPaymentManager new];
                        instance.wepay = [[WePay alloc] initWithConfig:config];
                   });
    
    return instance;
}

#pragma mark - Instance Methods

- (void) tokenizeCreditCardWithInfo:(WCCreditCardModel *) info
                     isMerchantUser:(BOOL) isMerchantUser
                              email:(NSString *) email
                           delegate:(id) delegate
{
    WPPaymentInfo *paymentInfo;
    WPAddress *address;
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSString *month, *year;

    // Extract the needed parameters from the credit card model
    address = [[WPAddress alloc] initWithZip:info.zipCode];

    formatter.dateFormat = @"MM";
    month = [formatter stringFromDate:info.expirationDate];
    formatter.dateFormat = @"yyyy";
    year = [formatter stringFromDate:info.expirationDate];

    paymentInfo = [[WPPaymentInfo alloc] initWithFirstName:info.firstName
                                                  lastName:info.lastName
                                                     email:email
                                            billingAddress:address
                                           shippingAddress:nil
                                                cardNumber:info.cardNumber
                                                       cvv:info.cvvNumber
                                                  expMonth:month
                                                   expYear:year
                                           virtualTerminal:isMerchantUser];
    
    [self.wepay tokenizePaymentInfo:paymentInfo tokenizationDelegate:delegate];
}

- (void) startCardReadTokenizationWithReaderDelegate:(id) readerDelegate
                                tokenizationDelegate:(id) tokenizationDelegate
{
    [self.wepay startCardReaderForTokenizingWithCardReaderDelegate:readerDelegate
                                              tokenizationDelegate:tokenizationDelegate
                                             authorizationDelegate:nil];
}

- (void) startCardReadWithDelegate:(id) readerDelegate
{
    [self.wepay startCardReaderForReadingWithCardReaderDelegate:readerDelegate];
}

- (void) storeSignatureImage:(UIImage *) signatureImage
               forCheckoutID:(NSString *) checkoutID
           signatureDelegate:(id) signatureDelegate
{
    [self.wepay storeSignatureImage:signatureImage
                      forCheckoutId:checkoutID
                   checkoutDelegate:signatureDelegate];
}

@end
