//
//  RESTClient.h
//  IntWashCore
//
//  Created by Apro on 04/09/15.
//  Copyright (c) 2015 RocketInternet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RESTClient.h"

@interface RESTClientImpl : NSObject<RESTClient>

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedClient;

- (nullable instancetype)init NS_UNAVAILABLE;

NS_ASSUME_NONNULL_END

@end
