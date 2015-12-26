//
//  LinkModel.m
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "LinkModel.h"
#import "RESTClientImpl.h"
#import <RegExCategories/RegExCategories.h>

static id<RESTClient> RESTClient;
static NSString *RxTitleTag = @"<title>(.?)</title>";

@interface LinkModel ()

@property (nonnull, nonatomic, copy, readwrite) NSString *url;

@property(nonnull, nonatomic, strong, readwrite) RxMatch *titleMatch;

@end

@implementation LinkModel

+ (void)initialize
{
    if (self == [LinkModel class]) {
        RESTClient = [RESTClientImpl sharedClient];
    }
}

- (instancetype)initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = url;
        [RESTClient getRequest:url params:nil completion:^(id response, NSError *error) {
            if (!error && [response isKindOfClass:[NSString class]]) {
                _titleMatch = [response firstMatchWithDetails:RX(RxTitleTag)];
            }
        }];
    }
    return self;
}

@end
