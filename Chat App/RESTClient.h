//
//  RESTClient.h
//  IntWashCore
//
//  Created by Apro on 04/09/15.
//  Copyright (c) 2015 RocketInternet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTClient <NSObject>

/*!
 *  @brief  Method used to run a GET request
 *
 *  @param path    URl path
 *  @param params  URL params
 *  @param handler Completion handler
 */
- (void) getRequest:(nonnull NSString *) path params:(nullable NSDictionary *) params
         completion:(nonnull void(^)(id _Nullable response, NSError *_Nullable error)) handler;


@end
