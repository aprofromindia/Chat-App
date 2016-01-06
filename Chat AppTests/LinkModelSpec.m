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
    
    it(@"", ^{

    });  
    
    afterEach(^{
        _linkModel = nil;
    });
});

SpecEnd
