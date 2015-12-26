//
//  ResponseModel.h
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import <Mantle/Mantle.h>

@class LinkModel, RxMatch;

@interface ResponseModel : MTLModel<MTLJSONSerializing>

@property(nonnull, nonatomic, copy, readonly) NSArray<RxMatch *> *mentions;

@property(nonnull, nonatomic, copy, readonly) NSArray<RxMatch *> *emoticons;

@property(nonnull, nonatomic, copy, readonly) NSArray<LinkModel *> *links;

- (nonnull instancetype)initWithString:(nonnull NSString *)string NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
