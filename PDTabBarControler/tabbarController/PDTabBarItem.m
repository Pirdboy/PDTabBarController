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

@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;
@property (nonatomic, strong) UIFont *font;

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
    
    _titleNormalColor = [UIColor redColor];
    _titleSelectedColor = [UIColor greenColor];
    _font = [UIFont systemFontOfSize:12];
    
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

- (void)updateViewContent {
    if(self.isSelected) {
        [_imageView setImage:_selectedImage];
        [_titleLabel setTextColor:_titleSelectedColor];
    } else {
        [_imageView setImage:_image];
        [_titleLabel setTextColor:_titleNormalColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    CGFloat width = frame.size.width;
    
    CGRect titleFrame = _titleLabel.frame;
    _imageView.frame = (CGRect){(width-24)/2.0, 2, 24, 24};
    _titleLabel.frame = (CGRect){(width-60)/2.0, 34, titleFrame.size.width, titleFrame.size.height};
    
    
}

@end
