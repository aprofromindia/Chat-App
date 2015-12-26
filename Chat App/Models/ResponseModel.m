//
//  ResponseModel.m
//  Chat App
//
//  Created by Apro on 24/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "ResponseModel.h"
#import <RegExCategories/RegExCategories.h>
#import "RxMatch+NSDictionary.h"
#import "LinkModel.h"

static NSString *const kMentionRx = @"@(\\w+)";
static NSString *const kEmoticonRx = @"\\(([a-z1-9]{1,15})\\)";
static NSString *const kUrlRx = @"@^(https?|ftp)://[^\\s/$.?#].[^\\s]*$@iS";

@interface ResponseModel ()

@property(nonnull, nonatomic, copy, readwrite) NSArray<RxMatch *> *mentions;

@property(nonnull, nonatomic, copy, readwrite) NSArray<RxMatch *> *emoticons;

@property(nonnull, nonatomic, copy, readwrite) NSArray<LinkModel *> *links;

@end

@implementation ResponseModel

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        _mentions = [string matchesWithDetails:RX(kMentionRx)];
        _emoticons = [string matchesWithDetails:[Rx rx:kEmoticonRx ignoreCase:YES]];
        _links = [string matches:RX(kUrlRx)];
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"mentions" : @"mentions",
             @"emoticons" : @"emoticons",
             @"links" : @"links"
             };
}

+ (NSValueTransformer *) mentionsTransformer{
    return [MTLJSONAdapter  arrayTransformerWithModelClass:RxMatch.class];
}

+ (NSValueTransformer *) emoticonsTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:RxMatch.class];
}

+ (NSValueTransformer *) linksTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:LinkModel.class];
}

@end
