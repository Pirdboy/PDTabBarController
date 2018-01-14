//
// PDTabBarController.h
// PDTabBarControler
//
// Created by pirdboy on 2018/1/9.
// Copyright © 2018年 pirdboy. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "PDTabBar.h"

@class PDTabBarController;

@protocol PDTabBarControllerDelegate <NSObject>
@optional
- (void)tabBarController:(PDTabBarController *)tabBarController willSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(PDTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

NS_CLASS_AVAILABLE_IOS(8_0) @interface PDTabBarController : UIViewController

/// tabBarController's delegate
@property (nonatomic, weak) id<PDTabBarControllerDelegate> delegate;

/// the corresponding tabBar
@property (nonatomic, strong, readonly) PDTabBar *tabBar;

/// The tabBarController's child ViewControllers
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;

/// the selected ViewController
@property (nonatomic, weak, readonly) UIViewController *selectedViewController;

/// the selected Index
@property (nonatomic, assign) NSUInteger selectedIndex;

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems;


/**
 show the tabBar

 @param animated If YES, it will show the tabBar with animation
 */
- (void)showTabBarAnimated:(BOOL)animated;

/**
 hide the tabBar

 @param animated If YES, it will hide the tabBar with animation
 */
- (void)hideTabBarAnimated:(BOOL)animated;

/**
 set new ViewController at Index

 @param viewController the viewController to be set
 @param index the index in the tabBarController's childViewControllers
 */
- (void)setViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;

@end

@interface UIViewController (PDTabBarController)

// TODO: 增加获取当前ViewController对应的tabBarItem的方法

/// The nearest ancestor in the view controller hierarchy that is a tab bar controller.
- (PDTabBarController *)pd_tabBarController;

@end
