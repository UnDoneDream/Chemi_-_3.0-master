//
//  UINavigationBar+CoverView.h
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/11.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (CoverView)
@property (nonatomic, strong) UIView *coverView;

- (void)setCoverViewBackgroundColor:(UIColor *)color;

- (void)_setElementsAlpha:(CGFloat)alpha;
- (void)_setTranslationY:(CGFloat)translationY;
- (void)_resetCoverView;
@end
