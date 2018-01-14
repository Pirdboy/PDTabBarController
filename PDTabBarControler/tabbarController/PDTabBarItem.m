//
//  PDTabBarItem.m
//  PDTabBarControler
//
//  Created by pirdboy on 2018/1/9.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "PDTabBarItem.h"

@interface PDTabBarItem()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;



@end

@implementation PDTabBarItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if(self) {
        _title = title;
        _image = image;
        _selectedImage = selectedImage;
        [self configureSubViews];
    }
    return self;
}

- (void)configureSubViews {
    _titlePositionAdjustment = UIOffsetZero;
    _imagePositionAdjustment = UIOffsetZero;
    
    _titleNormalColor = [UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:1.0];
    _titleSelectedColor = [UIColor colorWithRed:216/255.0 green:58/255.0 blue:41/255.0 alpha:1.0];
    _font = [UIFont systemFontOfSize:10];
    _imageSize = (CGSize){24, 24};
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _title;
    [_titleLabel setFont:_font];
    [_titleLabel setTextColor:_titleNormalColor];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel sizeToFit];
    _imageView = [[UIImageView alloc] init];
    _imageView.image = _image;
    [self addSubview:_titleLabel];
    [self addSubview:_imageView];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateViewContent];
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment {
    _titlePositionAdjustment = titlePositionAdjustment;
    [self setNeedsLayout];
}

- (void)setImagePositionAdjustment:(UIOffset)imagePositionAdjustment {
    _imagePositionAdjustment = imagePositionAdjustment;
    [self setNeedsLayout];
}
- (void)setImage:(UIImage *)image {
    _image = image;
    [self updateViewContent];
}
- (void)setSelectedImage:(UIImage *)selectedImage {
    _selectedImage = selectedImage;
    [self updateViewContent];
}
- (void)setFont:(UIFont *)font {
    _font = font;
    [_titleLabel setFont:_font];
    [_titleLabel sizeToFit];
}

- (void)updateViewContent {
    if(self.isSelected) {
        [_imageView setImage:_selectedImage];
        [_titleLabel setTextColor:_titleSelectedColor];
        
        // comment out this if you don't need animation when selected
        self.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView animateWithDuration:0.1 animations:^(void){
            self.transform = CGAffineTransformIdentity;
        }];
         
    } else {
        [_imageView setImage:_image];
        [_titleLabel setTextColor:_titleNormalColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    CGFloat width = frame.size.width;
    UIOffset offset = _titlePositionAdjustment;
    CGSize titleSize = _titleLabel.frame.size;
    
    _titleLabel.frame = (CGRect){(width-titleSize.width)/2.0+offset.horizontal, 30+offset.vertical, titleSize.width, titleSize.height};
    offset = _imagePositionAdjustment;
    _imageView.frame = (CGRect){(width-_imageSize.width)/2.0+offset.horizontal, 3+offset.vertical, _imageSize.width, _imageSize.height};
}

@end
