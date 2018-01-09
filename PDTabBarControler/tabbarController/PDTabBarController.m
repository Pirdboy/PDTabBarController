//
//  PDTabBarController.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "PDTabBarController.h"

@interface PDTabBarController ()

@property (nonatomic, strong) PDTabBar *tabBar;

@end

@implementation PDTabBarController

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems {
    self = [super init];
    if(self) {
        _tabBar = [[PDTabBar alloc] initWithTabBarItems:tabBarItems];
        _viewControllers = viewControllers;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)showTabBar {
    
}

- (void)hideTabBar {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
