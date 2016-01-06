//
//  ResponseModelSpec.m
//  Chat App
//
//  Created by Apro on 06/01/16.
//  Copyright 2016 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "ResponseModel.h"


SpecBegin(ResponseModel)

describe(@"ResponseModel", ^{
    
    context(@"mentions + emoticons + links string", ^{
        ResponseModel *responseModel = [[ResponseModel alloc] initWithString:@"@bob @john (success) such a cool feature; https://twitter.com/jdorfman/status/430511497475670016"];
        
        it(@"should return a dictionary of count 3", ^{
            waitUntil(^(DoneCallback done) {
                [responseModel toJSONDict:^(NSDictionary *dict) {
                    expect(dict).to.beKindOf([NSDictionary class]);
                    expect(dict).to.haveACountOf(3);
                    expect(dict[@"mentions"]).to.beKindOf([NSArray class]);
                    expect(dict[@"emoticons"]).to.beKindOf([NSArray class]);
                    expect(dict[@"links"]).to.beKindOf([NSArray class]);
                    done();
                }];
            });
        });
        
        it(@"should serialise to a JSON string", ^{
            waitUntil(^(DoneCallback done) {
                [responseModel toJSONDict:^(NSDictionary *dict) {
                    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
                    expect(data).notTo.beNil;
                    expect(data).to.beKindOf([NSData class]);
                    
                    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    expect(jsonString).notTo.beNil;
                    expect(jsonString).to.beKindOf([NSString class]);
                    done();
                }];
            });
        });
    });
    
    context(@"mentions only string", ^{
        ResponseModel *responseModel = [[ResponseModel alloc] initWithString:@"@chris you around?"];
        
        it(@"should return a 1 element Dictionary", ^{
            waitUntil(^(DoneCallback done) {
               [responseModel toJSONDict:^(NSDictionary *dict) {
                   expect(dict).to.beKindOf([NSDictionary class]);
                   expect(dict).to.haveACountOf(1);
                   done();
               }];
            });
        });
        
    });

    context(@"mentions + emoticons string", ^{
        ResponseModel *responseModel = [[ResponseModel alloc] initWithString:@"@chris - Good morning! (megusta) (coffee)"];
        
        it(@"should return a 2 element Dictionary", ^{
            waitUntil(^(DoneCallback done) {
                [responseModel toJSONDict:^(NSDictionary *dict) {
                    expect(dict).to.beKindOf([NSDictionary class]);
                    expect(dict).to.haveACountOf(2);
                    done();
                }];
            });
        });
        
    });
});

SpecEnd
