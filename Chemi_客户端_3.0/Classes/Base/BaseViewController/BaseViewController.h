//
//  BaseViewController.h
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//
#warning message  遗漏public方法 ，程序员自定义返回按钮触发事件，root/pop

#import <UIKit/UIKit.h>
/** BXImageH */
#define imageHs [UIScreen mainScreen].bounds.size.width
@interface BaseViewController : UIViewController

/**首部标题*/
@property (strong,nonatomic,readonly) UIScrollView *trysScrolls;

@property (copy,nonatomic) NSString *titles;

/*
 *区分需要底部scrollView的控制器
 */
@property (copy,nonatomic) NSString *types;

- (void)setNavigationBarBackgroundImage:(UIImage *)image
                              tintColor:(UIColor *)tintColor
                              textColor:(UIColor *)textColor
                         statusBarStyle:(UIStatusBarStyle)style;
- (void)setNavigationBarCover:(UIScrollView *)scrollView
                        color:(UIColor *)color;

/*
 *push不隐藏tabbar
 */
- (void)pushController:(BaseViewController *)controller;
/*
 *push隐藏tabbar
 */
- (void)hideBottomBarPush:(BaseViewController *)controller;


/*
 *设置titleView图片
 */
- (void)setTitleView:(NSString *)imageName;



/*
 *设置返回按钮(上一个页面设置)
 */
- (void)setBackItem:(NSString *)title action:(SEL)sel;

/*
 * 设置左边返回按钮图片
 */
- (void)setLeftImageNamed:(NSString *)name action:(SEL)action;
/*
 * 设置左边返回按钮标题／图片
 */
- (void)setLeftItemTitle:(NSString *)title andImageNamed:(NSString *)name andAction:(SEL)action;
/*
 * 设置左边返回按钮标题
 */
- (void)setLeftItemTitle:(NSString *)title action:(SEL)action;



/*
 *导航栏右边RightItem文字
 */
- (void)setRightItemTitle:(NSString *)title
                   action:(SEL)action;

- (void)setRightItemTitle:(NSString *)title
               titleColor:(UIColor *)color
                   action:(SEL)action;

/*
 *导航栏右边RightItem图片
 */
- (void)setRightImageNamed:(NSString *)name
                    action:(SEL)action;

/*
 *导航栏右边RightItem多个图片
 */
- (void)setupRightItems:(NSArray *)images;

@end
