//
//  PDTabBar.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "PDTabBarItem.h"
#import "PDTabBar.h"

@interface PDTabBar()

@property (nonatomic, strong) UIImageView *topLineView;  // 顶部横线
@end

@implementation PDTabBar

- (instancetype)initWithTabBarItems:(NSArray<PDTabBarItem *> *)tabItems {
    self = [super init];
    if(self) {
        _tabItems = tabItems;
    }
    return self;
}

- (void)commonInitialize {
    
    for(int i=0;i<_tabItems.count;i++) {
        PDTabBarItem *item = _tabItems[i];
        [item addTarget:self action:@selector(tabBarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if(_tabItems.count > 0) {
        CGRect frame = self.frame;
        
        CGFloat itemWidth = frame.size.width / _tabItems.count;
        CGFloat itemHeight = frame.size.height;
        
        for(int i=0;i<_tabItems.count;i++) {
            PDTabBarItem *tabItem = _tabItems[i];
            tabItem.frame = (CGRect){itemWidth * i, 0, itemWidth, itemHeight};
        }
    }
}

#pragma mark - TabItem Select

- (void)tabBarItemSelected:(PDTabBarItem *)sender {
    NSUInteger index = [_tabItems indexOfObject:sender];
    if(index != NSNotFound) {
        
        // 通过delegate方式回调
        if([_delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
            [_delegate tabBar:self didSelectItemAtIndex:index];
        }
    }
    
    NSLog(@"当前sender selected:%@",sender.isSelected?@"Y":@"N");
}

@end
