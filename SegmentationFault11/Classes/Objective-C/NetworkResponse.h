//
//  NetworkResponse.h
//  SegmentationFaultError11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetworkResponse : NSObject

@property (nonatomic, strong, nullable, readonly) NSURLResponse *urlResponse;
@property (nonatomic, strong, nullable, readonly) NSData *data;
@property (nonatomic, strong, nullable, readonly) NSError *networkError;

- (nonnull instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithUrlResponse:(nullable NSURLResponse *)urlResponse
                                        data:(nullable NSData *)data
                                networkError:(nullable NSError *)networkError NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithUrlResponse:(nullable NSURLResponse *)urlResponse
                                        data:(nullable NSData *)data;

- (nullable instancetype)initWithUrlResponse:(nullable NSURLResponse *)urlResponse;

- (nullable instancetype)initWithData:(nullable NSData *)data;

- (void)silenceWarning;

@end
