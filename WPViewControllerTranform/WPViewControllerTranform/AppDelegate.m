//
//  AppDelegate.m
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WPCoustomNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController * vc = [[ViewController alloc]init];
    
    WPCoustomNavigationViewController * na = [[WPCoustomNavigationViewController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = na;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
