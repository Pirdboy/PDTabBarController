//
//  PDTabBarItem.h
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDTabBarItem : UIControl

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIImage *selectedImage;


- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
