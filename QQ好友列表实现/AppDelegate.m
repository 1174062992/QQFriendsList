//
//  AppDelegate.m
//  QQ好友列表实现
//
//  Created by 曹记 on 2019/5/6.
//  Copyright © 2019 曹记. All rights reserved.
//

#import "AppDelegate.h"
#import "TemListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *全局导航栏设置
 */
-(void)navigationBarGlobalSettings{
    //1.设置导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    
    //2.设置导航栏背景图片
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBarImg"] forBarMetrics:UIBarMetricsDefault];
    
    //3.设置导航栏标题样式
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           [UIFont boldSystemFontOfSize:18], NSFontAttributeName, nil]];
    
    //4.设置导航栏返回按钮的颜色
   // [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
    
    //5.设置导航栏隐藏
    [[UINavigationBar appearance] setHidden:NO];
    //6.导航栏的半透明translucent属性
    //[[UINavigationBar appearance] setTranslucent:NO];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController* nav =[[UINavigationController alloc]initWithRootViewController:[[TemListViewController alloc]init]];
    self.window.rootViewController =nav;
    [self.window makeKeyAndVisible];
    [self navigationBarGlobalSettings ];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
