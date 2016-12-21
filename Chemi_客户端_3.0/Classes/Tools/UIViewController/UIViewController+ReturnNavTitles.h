//
//  UIViewController+ReturnNavTitles.h
//  iOS_客户端
//
//  Created by ju on 16/7/12.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ReturnNavTitles)

- (UIView *)returnShopDetailTitleViews:(NSString *)message andColor:(UIColor *)color;

/**
 *  返回导航栏主标题
 */
- (UIView *)returnNavTitlesAndTitles:(NSString *)message andColor:(UIColor *)color;

/**
 *  返回导航栏右边标题
 *
 *  @param buton       返回的button
 *  @param font        返回的button字体大小
 *  @param buttonTitle 返回button的标题
 */
- (UIView *)returnNavRight:(UIButton *)button andButtonFont:(CGFloat)font andButtonTitles:(NSString *)buttonTitle;

- (UIView *)returnAButtonInLeftBarButtonItem;

/*
 *  返回导航栏主题图片
 *
 *  @param ImagesName 图片名称
 */
- (UIView *)returnNavTitleViews:(NSString *)ImagesName;


- (UIView *)returnsNavTitleViews:(NSString *)viewsMessage;

@end

