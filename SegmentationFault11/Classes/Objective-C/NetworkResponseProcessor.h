//
//  FaultyObject.h
//  SegmentationFaultError11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NetworkResponse;


@interface NetworkResponseProcessor : NSObject

- (nullable id)process:(nullable NSURLResponse *)response
                                 data:(nullable NSData *)data
                         networkError:(nullable NSError *)networkError
                                error:(NSError * _Nullable * _Nullable)error;

- (nullable id)process:(nullable NSURLResponse *)response
                                 data:(nullable NSData *)data
                                error:(NSError * _Nullable * _Nullable)error;

- (nullable id)process:(nullable NSData *)response
                 error:(NSError * _Nullable * _Nullable)error;

- (nullable id)processNetworkResponse:(nonnull NetworkResponse *)response
                                error:(NSError * _Nullable * _Nullable)error;

@end
