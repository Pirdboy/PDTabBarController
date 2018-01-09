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

@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems;

- (void)showTabBar;
- (void)hideTabBar;

@end
