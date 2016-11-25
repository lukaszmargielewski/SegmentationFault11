//
//  NetworkResponse.m
//  SegmentationFaultError11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

#import "NetworkResponse.h"

@interface NetworkResponse()

@property (nonatomic, strong, nullable, readwrite) NSURLResponse *urlResponse;
@property (nonatomic, strong, nullable, readwrite) NSData *data;
@property (nonatomic, strong, nullable, readwrite) NSError *networkError;

@end

@implementation NetworkResponse

- (instancetype)initWithUrlResponse:(NSURLResponse *)urlResponse
                               data:(NSData *)data
                       networkError:(NSError *)networkError {
    self = [super init];
    if (self == nil) { return nil; }
    self.urlResponse = urlResponse;
    self.data = data;
    self.networkError = networkError;
    return self;
}
- (nullable instancetype)initWithUrlResponse:(nullable NSURLResponse *)urlResponse
                                        data:(nullable NSData *)data {
    return [self initWithUrlResponse:urlResponse data:data networkError:nil];
}

- (nullable instancetype)initWithUrlResponse:(nullable NSURLResponse *)urlResponse {
    return [self initWithUrlResponse:urlResponse data:nil networkError:nil];
}

- (nullable instancetype)initWithData:(nullable NSData *)data {
    return [self initWithUrlResponse:nil data:data networkError:nil];
}


- (void)silenceWarning {

}

@end
