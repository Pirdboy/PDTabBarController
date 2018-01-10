//
//  PDTabBarController.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "PDTabBarController.h"
#import <sys/utsname.h>

static CGFloat kTabBarHeight = 49.f;

@interface PDTabBarController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIViewController *contentViewController;

@end

@implementation PDTabBarController

@synthesize selectedIndex = _selectedIndex;
@synthesize selectedViewController = _selectedViewController;

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems {
    self = [super init];
    if(self) {
        _tabBar = [[PDTabBar alloc] initWithTabBarItems:tabBarItems];
        _viewControllers = viewControllers;
        _selectedIndex = 0;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self isIphoneX]) {
        kTabBarHeight = 49.f+34.f;
    }
    CGRect bounds = self.view.bounds;
    _containerView = [[UIView alloc] initWithFrame:bounds];
    [self.view addSubview:_containerView];
    _tabBar.frame = (CGRect){0, bounds.size.height-kTabBarHeight, bounds.size.width, kTabBarHeight};
    [self.view addSubview:_tabBar];
    
    self.contentViewController = _viewControllers[_selectedIndex];
}

- (void)showTabBar {
    CGRect bounds = self.view.bounds;
    _tabBar.frame = (CGRect){0, bounds.size.height-kTabBarHeight, bounds.size.width, kTabBarHeight};
}

- (void)hideTabBar {
    CGRect bounds = self.view.bounds;
    _tabBar.frame = (CGRect){0, bounds.size.height, bounds.size.width, kTabBarHeight};
}

#pragma mark - Set ViewController

- (void)setViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    UIViewController *oldViewController = _contentViewController;
    
    [oldViewController willMoveToParentViewController:nil];
    [oldViewController.view removeFromSuperview];
    [oldViewController removeFromParentViewController];
    
    
    UIViewController *newViewController = contentViewController;
    
    if (newViewController) {
        [newViewController willMoveToParentViewController:self];
        [self addChildViewController:newViewController];
        [_containerView addSubview:newViewController.view];
        newViewController.view.frame = _containerView.bounds;
        [newViewController didMoveToParentViewController:self];
    }
    _contentViewController = newViewController;
}

#pragma mark - Selected

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if(selectedIndex>=_viewControllers.count) {
        return;
    }
    _selectedIndex = selectedIndex;
    //...替换当前viewController
}

- (UIViewController *)selectedViewController {
    return _viewControllers[_selectedIndex];
}

#pragma mark -
#pragma mark - Helper

- (BOOL)isIphoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    BOOL ok1;
    if([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]) {
        CGRect b = [UIScreen mainScreen].nativeBounds;
        ok1 = ABS(b.size.height - 2436.0) < DBL_EPSILON;
    } else {
        CGRect b = [UIScreen mainScreen].bounds;
        ok1 = ABS(b.size.height - 812.0) < DBL_EPSILON;
    }
    
    BOOL ok2 = [deviceModel isEqualToString:@"iPhone10,3"] || [deviceModel isEqualToString:@"iPhone10,6"];
    return (ok1 || ok2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
