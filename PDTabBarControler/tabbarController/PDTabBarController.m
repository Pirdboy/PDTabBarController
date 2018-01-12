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

@interface PDTabBarController ()<PDTabbarDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIViewController *contentViewController;

@end

@implementation PDTabBarController

@synthesize selectedIndex = _selectedIndex;
@synthesize selectedViewController = _selectedViewController;

#pragma mark - Init
- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers tabBarItems:(NSArray<PDTabBarItem *> *)tabBarItems {
    self = [super init];
    if(self) {
        NSInteger count = MIN([viewControllers count], [tabBarItems count]);
        
        _tabBar = [[PDTabBar alloc] initWithTabBarItems:[tabBarItems subarrayWithRange:(NSRange){0, count}]];
        _tabBar.delegate = self;
        _viewControllers = [viewControllers subarrayWithRange:(NSRange){0, count}];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self isIphoneX]) {
        kTabBarHeight = 49.f+34.f;
    }
    CGRect bounds = self.view.bounds;
    _containerView = [[UIView alloc] initWithFrame:bounds];
    [self.view addSubview:_containerView];
    _tabBar.frame = (CGRect){0, bounds.size.height-kTabBarHeight, bounds.size.width, kTabBarHeight};
    _tabBar.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                UIViewAutoresizingFlexibleTopMargin);
    [self.view addSubview:_tabBar];
    
    self.selectedIndex = 0;
    [self showTabBar];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

#pragma mark - show/hide TabBar

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
    NSMutableArray *oldArray = [NSMutableArray arrayWithArray:_viewControllers];
    if(oldArray.count > index) {
        [oldArray replaceObjectAtIndex:index withObject:viewController];
        self.viewControllers = oldArray;
    }
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    if (viewControllers == _viewControllers) {
        return;
    }
    if (_viewControllers) {
        for (UIViewController *vc in _viewControllers) {
            
            [vc willMoveToParentViewController:nil];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
    }
    
    _viewControllers = viewControllers;
    
    if(_viewControllers.count > _selectedIndex) {
        self.selectedIndex = _selectedIndex;
    } else if(_viewControllers.count > 0){
        self.selectedIndex = 0;
    }
}



#pragma mark - set Selected

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if(!_viewControllers|| _viewControllers.count<=selectedIndex) {
        return;
    }
    _selectedIndex = selectedIndex;
    [_tabBar setSelectedItem:_tabBar.items[_selectedIndex]];
    self.contentViewController = _viewControllers[_selectedIndex];
}

- (UIViewController *)selectedViewController {
    if(_selectedIndex < _viewControllers.count) {
        return _viewControllers[_selectedIndex];
    }
    return nil;
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

#pragma mark -
#pragma mark - PDTabBarDelegate

- (void)tabBar:(PDTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index {
    
    self.selectedIndex = index;
    
    if([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.delegate tabBarController:self didSelectViewController:_viewControllers[index]];
    }
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
