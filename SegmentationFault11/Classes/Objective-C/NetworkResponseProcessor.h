//
//  FaultyObject.h
//  SegmentationFaultError11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetworkResponseProcessor : NSObject

- (nullable id)process:(nullable NSURLResponse *)response
                  data:(nullable NSData *)data
          networkError:(nullable NSError *)networkError
                 error:(NSError * _Nonnull * _Nullable)error; // <= Error: "Segmentation Fault 11".
              // error:(NSError * _Nullable * _Nullable)error;  // <= Compiles.
/*
 The innermost NSError pointer is required to be nullable if you want proper writeback semantics.
 The Swift compiler assumes you know this and crashes instead of emitting a diagnostic (bug!).
 */

@end
