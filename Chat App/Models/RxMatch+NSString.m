//
//  RxMatch+NSString.m
//  Chat App
//
//  Created by Apro on 27/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "RxMatch+NSString.h"

@implementation RxMatch (NSString)

- (NSString *) toString{
    return [self.groups[1] value];
}

@end
