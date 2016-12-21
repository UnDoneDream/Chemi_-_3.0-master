//
//  BaseTabBarController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "BaseTabBarController.h"
#import "tabBarView.h"
#import "CMTabButton.h"
@interface BaseTabBarController ()<tabBarViewDelegate>

@property (weak,nonatomic) tabBarView *customTab;

@property(nonatomic ,assign)NSInteger formIndex;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTab];
    [self iosuser2];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *btnView in self.tabBar.subviews) {
        if ([btnView isKindOfClass:[UIControl class]]) {
            [btnView removeFromSuperview];
        }
    }
    
}

- (void)setTab
{
    tabBarView *customTab = [[tabBarView alloc]init];
    customTab.delegat = self;
    customTab.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTab];
    self.customTab = customTab;
}

- (void)taBar:(tabBarView *)taBar didSelectButtonFrom:(NSInteger)from from:(NSInteger)to
{
    
    self.selectedIndex = to;
}


- (void)iosuser2
{
    ViewController *home1 = [[ViewController alloc]init];
    [self setupChildViewController:home1 title:@"失领中心" imageName:@"tab_mains_default.png" selectedImageName:@"tab_mains.png"];
    
    
    CarInsuranceViewController *carInsurance = [[CarInsuranceViewController alloc]init];
    
    [self setupChildViewController:carInsurance title:@"新闻咨询" imageName:@"tab_carinsurance_default.png" selectedImageName:@"tab_carinsurance.png"];
    
//    StopCarTableViewController *stopCar = [[StopCarTableViewController alloc]init];
//    [self setupChildViewController:stopCar title:@"停车" imageName:@"tab_stopcars-default.png" selectedImageName:@"tab_stopcars.png"];
//    
    ProfileTableViewController *profile = [[ProfileTableViewController alloc]init];
    [self setupChildViewController:profile title:@"管理中心" imageName:@"tab_mine_default.png" selectedImageName:@"tab_mine.png"];
    
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    if (iOS7) {
        
        childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
    {
        childVc.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName];
    }
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
//    //   导航栏颜色
//    [nav.navigationBar setBarTintColor:[UIColor clearColor]];
//    
//    //   去掉分割线
//    [nav.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    
//    [nav.navigationBar setShadowImage:[[UIImage alloc] init]];
    

    [self.customTab addTabButtonWithItem:childVc.tabBarItem];
}
- (void)viewDidLayoutSubviews
{
    for (UIView *btnView in self.tabBar.subviews) {
        if ([btnView isKindOfClass:[UIControl class]]) {
            [btnView removeFromSuperview];
        }
    }
    [super viewDidLayoutSubviews];
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    CMTabButton *batButton = self.customTab.subviews[self.formIndex];
    batButton.selected = NO;
    
    CMTabButton *baButton = self.customTab.subviews[selectedIndex];
    baButton.selected = YES;
    self.formIndex = selectedIndex;
}

@end
