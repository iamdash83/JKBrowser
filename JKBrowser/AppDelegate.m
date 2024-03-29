//
//  AppDelegate.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 ios-it. All rights reserved.
//

#import "AppDelegate.h"
#import "JKFile.h"
#import "JKDirectoryBrowseViewController.h"
#import "UIApplication+JK.h"
#import "JKFlatMenuBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"home directory:%@", NSHomeDirectory());
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *rootNavController = [UINavigationController new];
    JKDirectoryBrowseViewController *bowser = [[JKDirectoryBrowseViewController alloc] initWithPath:NSHomeDirectory()];
    [rootNavController pushViewController:bowser animated:NO];
    _window.rootViewController = rootNavController;
    [_window makeKeyAndVisible];
    
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 40, 40)];
//    v.backgroundColor = [UIColor redColor];
//    [_window addSubview:v];
//    
//    UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [v addGestureRecognizer:panGr];
    
//    JKFlatMenuBar *bar = [[JKFlatMenuBar alloc] initWithFrame:CGRectMake(100, 100, 60, 50) menus:@[@(MenuId_GoLine),@(MenuId_SearchText),@(MenuId_ScrollLine_Backward),@(MenuId_ScrollLine_Forward),@(MenuId_ScrollPage_Backward),@(MenuId_ScrollPage_Forward),@(MenuId_ScrollToTop),@(MenuId_ScrollToBottom)]];
//    [_window addSubview:bar];
    
    return YES;
}

- (void)handlePan:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:_window];
    CGPoint velocity = [pan velocityInView:_window];
    //NSLog(@"translation : %@", NSStringFromCGPoint(translation));
    //NSLog(@"velocity : %@", NSStringFromCGPoint(velocity));
    pan.view.frame = CGRectMake(pan.view.frame.origin.x + translation.x, pan.view.frame.origin.y + translation.y, pan.view.frame.size.width, pan.view.frame.size.height);
    [pan setTranslation:CGPointZero inView:_window];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
