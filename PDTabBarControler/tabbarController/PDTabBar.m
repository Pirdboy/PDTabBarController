//
//  PDTabBar.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//


#import "PDTabBar.h"

@interface PDTabBar()

@property (nonatomic, strong) UIView *topLineView;  // 顶部横线
@property (nonatomic, strong) UIImageView *backgroundView;  // 背景
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end

@implementation PDTabBar

- (instancetype)initWithTabBarItems:(NSArray<PDTabBarItem *> *)tabItems {
    self = [super init];
    if(self) {
        _items = tabItems;
        [self commonInitialize];
    }
    return self;
}

- (void)commonInitialize {
    
    // Translucent background
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    [self addSubview:_effectView];
    // Or use backgroundView to set custom background
    //... _backgroundView = [[UIImageView alloc] init];
    
    
    _topLineView = [[UIView alloc] init];
    _topLineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self addSubview:_topLineView];
    
    for(int i=0;i<_items.count;i++) {
        PDTabBarItem *item = _items[i];
        [self addSubview:item];
        [item addTarget:self action:@selector(tabBarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.bounds;
    _effectView.frame = self.bounds;
    _topLineView.frame = (CGRect){0, -0.33, frame.size.width, 0.33};
    
    if(_items.count > 0) {
        CGFloat itemWidth = frame.size.width / _items.count;
        CGFloat itemHeight = frame.size.height;
        
        for(int i=0;i<_items.count;i++) {
            PDTabBarItem *tabItem = _items[i];
            tabItem.frame = (CGRect){itemWidth * i, 0, itemWidth, itemHeight};
        }
    }
}

#pragma mark - TabItem Select

- (void)tabBarItemSelected:(PDTabBarItem *)sender {
    self.selectedItem = sender;
    
    NSUInteger index = [_items indexOfObject:sender];
    if(index != NSNotFound) {
        
        // 通过delegate方式回调
        if([_delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
            [_delegate tabBar:self didSelectItemAtIndex:index];
        }
    }
    
    NSLog(@"当前sender selected:%@",sender.isSelected?@"Y":@"N");
}

- (void)setSelectedItem:(PDTabBarItem *)selectedItem {
    if (selectedItem == _selectedItem) {
        return;
    }
    [_selectedItem setSelected:NO];
    
    _selectedItem = selectedItem;
    [_selectedItem setSelected:YES];
}

@end
