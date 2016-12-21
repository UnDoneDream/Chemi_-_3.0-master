//
//  CMTabButton.m
//  iOS_客户端
//
//  Created by ju on 16/1/14.
//  Copyright © 2016年 ju. All rights reserved.
//


#import "CMTabButton.h"
#import "UIImage+WH.h"
@interface CMTabButton()
@end
@implementation CMTabButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:CNTabNomalColor forState:UIControlStateNormal];
        [self setTitleColor:CNTabSelectedColor forState:UIControlStateSelected];
                
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted
{
    
    
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH = contentRect.size.height * CNTabButtonImageRotio;
    return CGRectMake(0, 0, contentRect.size.width, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * CNTabButtonImageRotio;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY,contentRect.size.width,titleH);
}
- (void)setItem:(UITabBarItem *)item
{  
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}
@end

