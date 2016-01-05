//
//  RESTClient.m
//  IntWashCore
//
//  Created by Apro on 04/09/15.
//  Copyright (c) 2015 RocketInternet. All rights reserved.
//

#import "RESTClientImpl.h"
#import <AFNetworking/AFNetworking.h>

@implementation RESTClientImpl{
    AFHTTPSessionManager *_sessionMgr;
}


+ (instancetype)sharedClient{
    static RESTClientImpl *client;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        client = [[self alloc] init];
        client->_sessionMgr = [AFHTTPSessionManager new];
        client->_sessionMgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return client;
}

- (void) getRequest:(NSString *) url params:(NSDictionary *) params completion:(void(^)(id response, NSError *error)) handler{
    [_sessionMgr GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, error);
    }];
}
@end
