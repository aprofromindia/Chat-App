//
//  LinkModel.h
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkModel : NSObject

@property (nonnull, nonatomic, copy, readonly) NSString *url;

@property(nonnull, nonatomic, strong, readonly) NSString *title;

- (nonnull instancetype)initWithURL:(nonnull NSString *) url NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void)toJSONDict:(nonnull void(^)(NSDictionary *_Nonnull)) handler;

@end
