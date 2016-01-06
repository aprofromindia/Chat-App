//
//  LinkModelSpec.m
//  Chat App
//
//  Created by Apro on 06/01/16.
//  Copyright 2016 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "LinkModel.h"


SpecBegin(LinkModel)

describe(@"LinkModel", ^{
    
    __block LinkModel *_linkModel;
    
    beforeEach(^{
        _linkModel = [[LinkModel alloc] initWithURL:@"http://twitter.com"];
    });
    
    describe(@"JSON dictionary encoding", ^{
        
        it(@"should have a title", ^{
            waitUntil(^(DoneCallback done) {
               [_linkModel toJSONDict:^(NSDictionary *dict) {
                   expect(_linkModel.title).notTo.beNil;
                   expect(_linkModel.title).to.beKindOf([NSString class]);
                   expect(_linkModel.title).to.equal(@"Welcome to Twitter");
                   done();
               }];
            });
        });
    });
    
    afterEach(^{
        _linkModel = nil;
    });
});

SpecEnd
