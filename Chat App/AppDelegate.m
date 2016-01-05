//
//  AppDelegate.m
//  Chat App
//
//  Created by Apro on 17/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation AppDelegate

#pragma mark - private methods

- (void)p_setupLogger {
    // CocoaLumberJack installs
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
}

#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self p_setupLogger];

    return YES;
}

@end
