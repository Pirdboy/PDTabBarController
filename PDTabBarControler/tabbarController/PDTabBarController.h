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

@interface PDTabBarController : UIViewController

@property (nonatomic, weak) id<PDTabBarControllerDelegate> delegate;

@property (nonatomic, strong, readonly) PDTabBar *tabBar;

@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;

@property (nonatomic, weak, readonly) UIViewController *selectedViewController;

@property (nonatomic, assign) NSUInteger selectedIndex;

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems;

- (void)showTabBar;

- (void)hideTabBar;

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers;

- (void)setViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;


@end
