//
//  OneController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/11.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "OneController.h"
#import "twoController.h"
@interface OneController ()

@end

@implementation OneController

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    [self setNavigationBarBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]
//                                tintColor:[UIColor clearColor]
//                                textColor:[UIColor clearColor]
//                           statusBarStyle:UIStatusBarStyleDefault];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    UIView *back = [[UIView alloc]init];
    back.tag = 1000;
    back.backgroundColor = [UIColor redColor];
    back.x = 100;
    back.y = 100;
    back.width = 100;
    back.height = 100;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taps)];
    [back addGestureRecognizer:gesture];
    [self.trysScrolls addSubview:back];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self setNavigationBarCover:scrollView color:[UIColor whiteColor]];
    
}

- (NSString *)titles
{

  return @"ones";
}
- (void)taps
{
    
    twoController *one = [[twoController alloc]init];
    
    [self.navigationController pushViewController:one animated:YES];
    
}
@end
