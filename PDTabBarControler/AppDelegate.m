//
//  AppDelegate.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "AppDelegate.h"
#import "PDTabBarController.h"

float r(){
    uint32_t a = arc4random_uniform(10000)%255;
    return a*1.0/255.0;
}

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];//[UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    NSArray *array = @[vc1, vc2, vc3, vc4, vc5];
    
    PDTabBarItem *item1 = [[PDTabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_selected"]];
    PDTabBarItem *item2 = [[PDTabBarItem alloc] initWithTitle:@"参考" image:[UIImage imageNamed:@"reference"] selectedImage:[UIImage imageNamed:@"reference_selected"]];
    PDTabBarItem *item3 = [[PDTabBarItem alloc] initWithTitle:@"理财" image:[UIImage imageNamed:@"fortune"] selectedImage:[UIImage imageNamed:@"fortune_selected"]];
    PDTabBarItem *item4 = [[PDTabBarItem alloc] initWithTitle:@"生活" image:[UIImage imageNamed:@"life"] selectedImage:[UIImage imageNamed:@"life_selected"]];
    PDTabBarItem *item5 = [[PDTabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"mine"] selectedImage:[UIImage imageNamed:@"mine_selected"]];
    NSArray *array2 = @[item1, item2, item3, item4, item5];
    
    PDTabBarController *tabBarController = [[PDTabBarController alloc] initWithViewControllers:array tabBarItems:array2];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    _window = [[UIWindow alloc] initWithFrame:bounds];
    _window.rootViewController = tabBarController;
    [_window makeKeyAndVisible];

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
