//
//  AppDelegate.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SuperViewController.h"
#import "GoalViewController.h"
#import "AsiaViewController.h"
#import "FunViewController.h"
#import "Define.h"
#import "AppListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)createTabBarController{
    //1.中超
    SuperViewController *svc = [[SuperViewController alloc]init];
    //设置标题
    //    svc.title = @"世界足球";
    //设置tabbaritem
    svc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"世足" image:[UIImage imageNamed:@"tabbar_limitfree.png"] tag:1];
    svc.requestUrl = kLimitUrl;
    svc.type = kLimitType;
    
    
    UINavigationController *nc1 = [[UINavigationController alloc]initWithRootViewController:svc];
    
    //2.图集
    GoalViewController *gvc = [[GoalViewController alloc]init];
    gvc.title = @"图集";
    gvc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"图集" image:[UIImage imageNamed:@"tabbar_subject.png"] tag:2];
    //    gvc.requestUrl = kLimitUrl;
    //    gvc.type = kLimitType;
    
    UINavigationController *nc2 = [[UINavigationController alloc]initWithRootViewController:gvc];
    
    //3.热榜
    AsiaViewController *avc = [[AsiaViewController alloc]init];
    avc.title = @"热榜";
    avc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"热榜" image:[UIImage imageNamed:@"tabbar_appfree.png"] tag:3];
    
    UINavigationController *nc3 = [[UINavigationController alloc]initWithRootViewController:avc];
    
    //4.趣球
    FunViewController *fvc = [[FunViewController alloc]init];
    fvc.title = @"趣球";
    fvc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"趣球" image:[UIImage imageNamed:@"tabbar_rank.png"] tag:4];
    //    UINavigationController *nc4 = [[UINavigationController alloc]initWithRootViewController:fvc];
    
    //创建分栏控制器
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[nc1,nc2,nc3,fvc];
    self.window.rootViewController = tabBarController;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    self.window.backgroundColor = [UIColor whiteColor];
    [self createTabBarController];
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
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
