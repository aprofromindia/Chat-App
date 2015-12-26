//
//  LinkModel.h
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import <Mantle/Mantle.h>

@class RxMatch;

@interface LinkModel : MTLModel

@property (nonnull, nonatomic, copy, readonly) NSString *url;

@property(nonnull, nonatomic, strong, readonly) RxMatch *titleMatch;

- (nonnull instancetype)initWithURL:(nonnull NSString *) url NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
