//
//  RxMatch+NSDictionary.m
//  Chat App
//
//  Created by Apro on 26/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "RxMatch+NSDictionary.h"

@implementation RxMatch (NSString)

- (NSString *)toString{
    return [self.groups[1] value];
}

@end
