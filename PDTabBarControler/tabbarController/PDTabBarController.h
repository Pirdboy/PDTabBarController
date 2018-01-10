//
//  PDTabBarController.h
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDTabBar.h"

@interface PDTabBarController : UIViewController

@property (nonatomic, strong) PDTabBar *tabBar;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, weak, readonly) UIViewController *selectedViewController;

@property (nonatomic, assign) NSUInteger selectedIndex;

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems;

- (void)showTabBar;

- (void)hideTabBar;

- (void)setViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;

@end
