//
//  PDTabBarItem.h
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface PDTabBarItem : UIControl

/// The title displayed in tabBarItem
@property (nonatomic, strong) NSString *title;

/// The titleLabel's text font
@property (nonatomic, strong) UIFont *font;

/// The unselected image displayed in tabBarItem
@property (nonatomic, strong) UIImage *image;

/// The selected image displayed in tabBarItem
@property (nonatomic, strong) UIImage *selectedImage;

/// The imageView's size, default is {24, 24}
@property (nonatomic, assign) CGSize imageSize;

/// Title color when unselected
@property (nonatomic, strong) UIColor *titleNormalColor;

/// Title color when selected
@property (nonatomic, strong) UIColor *titleSelectedColor;

/// Title position custom adjust
@property (nonatomic, assign) UIOffset titlePositionAdjustment;

/// Image position custom adjust
@property (nonatomic, assign) UIOffset imagePositionAdjustment;

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
