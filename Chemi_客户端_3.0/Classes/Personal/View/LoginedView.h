//
//  LoginedView.h
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginedView : UIView

+ (instancetype) LoginedViewWithFrame:(CGRect)frame icon:(UIImage *)icon name:(NSString *)name;

- (instancetype) initWithFrame:(CGRect)frame icon:(UIImage *)icon name:(NSString *)name;

@end
