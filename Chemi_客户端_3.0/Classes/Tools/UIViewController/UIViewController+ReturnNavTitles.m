//
//  UIViewController+ReturnNavTitles.m
//  iOS_客户端
//
//  Created by ju on 16/7/12.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "UIViewController+ReturnNavTitles.h"
#import "NavsView.h"
@implementation UIViewController (ReturnNavTitles)

- (UIView *)returnNavTitleViews:(NSString *)ImagesName
{
   UIImage *image = [UIImage imageNamed:ImagesName];
    
      UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        imageV.center = CGPointMake(CNScreenWidth/2, 256*CNScreenHeight/667);
        imageV.image = image;
    
    return imageV;
}


- (UIView *)returnNavTitlesAndTitles:(NSString *)message andColor:(UIColor *)color;
{
    
    UILabel *define = [[UILabel alloc]init];
    define.width = 150;
    define.height = 25;
    define.textAlignment = NSTextAlignmentCenter;
    define.font = [UIFont systemFontOfSize:18.0];
    define.textColor = color;
    define.text = message;
    
    return define;
}

- (UIView *)returnNavRight:(UIButton *)button andButtonFont:(CGFloat)font andButtonTitles:(NSString *)buttonTitle
{
//    button = [[UIButton alloc]init];
    button.size = CGSizeMake(80, 20);
    [button setContentMode:UIViewContentModeRight];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
    [button setTitleColor:CNColor(36, 199, 137) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    return button;
}

- (UIView *)returnAButtonInLeftBarButtonItem
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //      [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"返回-2"] forState:UIControlStateNormal];
    button.size = CGSizeMake(70, 30);
    // 让按钮内部的所有内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    // [button sizeToFit];
    // 让按钮的内容往左边偏移10
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    //      [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //      [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
  
    return button;
}

- (void)back
{


    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)returnsNavTitleViews:(NSString *)viewsMessage
{
    
    NavsView *views = [NavsView returnsNavViews];
    views.title.text = viewsMessage;
    return views;
}

- (UIView *)returnShopDetailTitleViews:(NSString *)message andColor:(UIColor *)color
{
    
    CGFloat is5 = 0;
    UIButton *define = [UIButton buttonWithType:UIButtonTypeCustom];
    define.userInteractionEnabled = NO;
    [define.titleLabel setAdjustsFontSizeToFitWidth:YES];
    define.width = 150;
    define.height = 25;
    define.titleLabel.font = [UIFont systemFontOfSize:18.0];
    if (message.length<=10) {
        
        [define.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
    }else
    {
        if (IS_IPHONE_5 || IS_IPHONE_4) {
            
            is5 = -25;
            
        }else if(IS_IPHONE_7PLUS || IS_IPHONE_7 || IS_IPHONE_6PLUS)
        {
            
            is5 = -4;
        }else if (IS_IPHONE_6)
        {
            is5 = 10;
        }
        
        [define setTitleEdgeInsets:UIEdgeInsetsMake(0, is5, 0, 0)];
    }
    
    [define setTitleColor:color forState:UIControlStateNormal];
    [define setTitle:message forState:UIControlStateNormal];
    
    return define;
}

@end
