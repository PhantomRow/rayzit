/**
 * Copyright (c) 2016 Data Management Systems Laboratory, University of Cyprus
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **/

//
//  AppDelegate.m
//  Rayzit
//
//  Created by Chrysovalantis Anastasiou on 29/8/14.
//  Copyright (c) 2014 DMSL. All rights reserved.
//

#import "AppDelegate.h"

#import <Crashlytics/Crashlytics.h>
#import "Flurry/Flurry.h"
#import <CocoaLumberjack/DDASLLogger.h>
#import <CocoaLumberjack/DDTTYLogger.h>
#import "LumberjackFormatter.h"

#ifdef DEBUG
#import <PDDebugger.h>
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef DEBUG
    PDDebugger *debugger = [PDDebugger defaultInstance];
    [debugger enableCoreDataDebugging];
    [debugger enableNetworkTrafficDebugging];
    [debugger forwardAllNetworkTraffic];
    [debugger enableViewHierarchyDebugging];
    [debugger connectToURL:[NSURL URLWithString:@"ws://192.168.1.179:9001/device"]];
#endif
    
    LumberjackFormatter *lumberjackFormatter = [[LumberjackFormatter alloc] init];
    
    [[DDASLLogger sharedInstance] setLogFormatter:lumberjackFormatter];
    [[DDTTYLogger sharedInstance] setLogFormatter:lumberjackFormatter];
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [RemoteStore sharedInstance];
    [[FayeManager sharedManager] subscribeToUserChannel:[[User appUser] userId]];
    [[FayeManager sharedManager] connect];
    
    
    [RayzitTheme customizeAppAppearance];

#ifndef DEBUG
    [Crashlytics startWithAPIKey:@"<YOUR_CRASHLYTICS_KEY>"];
    [CrashlyticsKit setUserIdentifier:[[User appUser] userId]];
    
    [Flurry startSession:@"<YOUR_FLURRY_KEY>"];
#endif
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [RemoteStore save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [RemoteStore save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [RemoteStore save];
}

@end