//
//  ProfileTableViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "ProfileTableViewController.h"

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *back = [[UIView alloc]init];
    back.backgroundColor = [UIColor blueColor];
    back.x = 100;
    back.y = 100;
    back.width = 100;
    back.height = 100;
    [self.trysScrolls addSubview:back];
    
}
#pragma mark  ------------------- 返回导航栏标题
- (NSString *)titles
{
    
    return @"管理中心";
}
@end
