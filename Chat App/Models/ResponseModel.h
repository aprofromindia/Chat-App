//
//  ResponseModel.h
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LinkModel;

@interface ResponseModel : NSObject

@property(nonnull, nonatomic, copy, readonly) NSArray<NSString *> *mentions;

@property(nonnull, nonatomic, copy, readonly) NSArray<NSString *> *emoticons;

@property(nonnull, nonatomic, copy, readonly) NSArray<LinkModel *> *links;

- (nonnull instancetype)initWithString:(nonnull NSString *)string NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void) toJSONDict:(nonnull void(^)(NSDictionary * _Nonnull)) handler;

@end
