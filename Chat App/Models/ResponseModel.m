//
//  ResponseModel.m
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "ResponseModel.h"
#import <RegExCategories/RegExCategories.h>
#import "LinkModel.h"
#import "RxMatch+NSString.h"


static NSString *const kMentionRx = @"@(\\w+)";
static NSString *const kEmoticonRx = @"\\(([a-z1-9]{1,15})\\)";
static NSString *const kUrlRx = @"(https?|ftp):\\/\\/[^\\s\\/\\$\\.\\?\\#]+\\.[^\\s]*";

@interface ResponseModel ()

@property(nonnull, nonatomic, copy, readwrite) NSArray<NSString *> *mentions;

@property(nonnull, nonatomic, copy, readwrite) NSArray<NSString *> *emoticons;

@property(nonnull, nonatomic, copy, readwrite) NSArray<LinkModel *> *links;

@end

@implementation ResponseModel

#pragma mark - private functions

NSArray<NSString *> * p_arrayFromRegex(NSString *string,  Rx *regex)
{
    assert(string != NULL && regex != NULL);
    
    NSArray<RxMatch *> *matches = [string matchesWithDetails:regex];
    NSMutableArray<NSString *> *mentions = [NSMutableArray arrayWithCapacity:matches.count];
    for (RxMatch *match in matches) {
        [mentions addObject:[match toString]];
    }
    return mentions;
}

NSArray<LinkModel *> * p_linksArrayFromRegex(NSString *string,  Rx *regex)
{
    assert(string != NULL && regex != NULL);
    
    NSArray<NSString *> *urls = [string matches:regex];
    NSMutableArray<LinkModel *> *links = [NSMutableArray arrayWithCapacity:urls.count];
    
    for (NSString *url in urls) {
        [links addObject:[[LinkModel alloc] initWithURL:url]];
    }
    return links;
}

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        _mentions = p_arrayFromRegex(string, RX(kMentionRx));
        _emoticons = p_arrayFromRegex(string, [Rx rx:kEmoticonRx ignoreCase:YES]);
        _links = p_linksArrayFromRegex(string, RX(kUrlRx));
    }
    return self;
}

- (void)toJSONDict:(void (^)(NSDictionary *))handler{
    NSMutableArray <NSDictionary *> *linkDicts = [NSMutableArray new];
    
    __block int i = 0;
    
    for (LinkModel *link in _links) {
        [link toJSONDict:^(NSDictionary *dict) {
            [linkDicts addObject:dict];
            i++;
            
            if(i == _links.count){
                NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:3];
                if (_mentions.count > 0) {
                    [dict setValue:_mentions forKey:@"mentions"];
                }
                
                if (_emoticons.count > 0) {
                    [dict setValue:_emoticons forKey:@"emoticons"];
                }
                
                if (_links.count > 0) {
                    [dict setValue:linkDicts forKey:@"links"];
                }
                handler(dict);
            }
        }];
    }
}

@end
