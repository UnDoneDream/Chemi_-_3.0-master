//
//  CarInsuranceViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "CarInsuranceViewController.h"

@interface CarInsuranceViewController ()

@end

@implementation CarInsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *back = [[UIView alloc]init];
    back.backgroundColor = [UIColor orangeColor];
    back.x = 100;
    back.y = 100;
    back.width = 100;
    back.height = 100;
    [self.trysScrolls addSubview:back];
}
#pragma mark  ------------------- 返回导航栏标题
- (NSString *)titles
{
    
    return @"新闻咨询";
}

@end
