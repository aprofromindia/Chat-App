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
#import "RxMatch+NSString.h"


static id<RESTClient> RESTClient;
static NSString *const kTitleTag = @"<title>(.*)<\\/title>";
static NSString *const kURLKey = @"url";
static NSString *const kTitleKey = @"title";

@interface LinkModel ()

@property(nonnull, nonatomic, strong, readonly) id<RESTClient> restClient;

@property (nonnull, nonatomic, copy, readwrite) NSString *url;

@property(nonnull, nonatomic, strong, readwrite) NSString *title;

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
    }
    return self;
}


- (void)toJSONDict:(void (^)(NSDictionary * _Nonnull))handler
{
    [RESTClient getRequest:_url params:nil completion:^(id response, NSError *error) {
        if (!error && [response isKindOfClass:[NSData class]]) {
            NSString *respString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
            self.title = [[respString firstMatchWithDetails:RX(kTitleTag)] toString];
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:2];
            [dict setValue:_url forKey:kURLKey];
            [dict setValue:_title forKey:kTitleKey];
            handler(dict);
        }
    }];
}

@end
