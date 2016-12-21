//
//  UIImage+WH.m
//  ItcastWeibo
//
//  Created by ma c on 15/10/19.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIImage+WH.h"

@implementation UIImage (WH)
/**
 *  用颜色返回一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
       
        NSString *newName = [name stringByAppendingString:@"_os"];
      //图片加载
        UIImage *imageNmae = [UIImage imageNamed:newName];
        if (imageNmae == nil) {
            
            imageNmae = [UIImage imageNamed:name];
        }
        return imageNmae;
    }
    return  [UIImage imageNamed:name];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
