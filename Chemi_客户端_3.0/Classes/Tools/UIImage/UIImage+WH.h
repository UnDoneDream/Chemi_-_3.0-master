//
//  UIImage+WH.h
//  ItcastWeibo
//
//  Created by ma c on 15/10/19.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WH)

+ (UIImage *)imageWithName:(NSString *)name;

//返回一张拉伸好的图片
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  用颜色返回一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;
@end
