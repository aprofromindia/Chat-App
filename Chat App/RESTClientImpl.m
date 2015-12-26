//
//  RESTClient.m
//  IntWashCore
//
//  Created by Apro on 04/09/15.
//  Copyright (c) 2015 RocketInternet. All rights reserved.
//

#import "RESTClientImpl.h"
#import <AFNetworking/AFNetworking.h>

static NSString *const kBaseURL = @"http://hidden-springs-1812.herokuapp.com/";

@implementation RESTClientImpl{
    AFHTTPSessionManager *_sessionMgr;
}


+ (instancetype)sharedClient{
    static RESTClientImpl *client;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        client = [[self alloc] init];
        client->_sessionMgr = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return client;
}

- (void) getRequest:(NSString *) path params:(NSDictionary *) params completion:(void(^)(id response, NSError *error)) handler{
    
    [_sessionMgr GET:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject)
    {
        handler(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        handler(nil, error);
    }];
}

@end
