//
//  AppDelegate.m
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    LoginViewController *loginController = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark - UISceneSession lifecycle

//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}

@end
