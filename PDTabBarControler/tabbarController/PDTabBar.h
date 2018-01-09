//
//  PDTabBar.h
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDTabBar;
@class PDTabBarItem;


@protocol PDTabbarDelegate<NSObject>
- (void)tabBar:(PDTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index;
@end

@interface PDTabBar : UIView

@property (nonatomic, strong) NSArray<PDTabBarItem *> *tabItems;

@property (nonatomic, weak) id<PDTabbarDelegate> delegate;

- (instancetype)initWithTabBarItems:(NSArray<PDTabBarItem *> *)tabItems;

@end
