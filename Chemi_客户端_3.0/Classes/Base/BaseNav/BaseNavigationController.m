//
//  BaseNavigationController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

+ (void)initialize
{
    //1.设置导航栏主题
    [self setNavThem];
}

+ (void)setNavThem
{
    //设置字体颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //设置字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    
    //3.设置UIBarButtonItem的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *arrItem = [NSMutableDictionary dictionary];
    //    arrItem[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:arrItem forState:UIControlStateNormal];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count>0) {
        
        //默认的返回按钮图片
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"detail_nav_back_28x28_"] forState:UIControlStateNormal];
        button.size = CGSizeMake(20, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
        [button addTarget:self action:@selector(popBackLastController) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:YES];
    
}

- (void)popBackLastController
{
    [SVProgressHUD dismiss];
    [self popViewControllerAnimated:YES];
}
@end
