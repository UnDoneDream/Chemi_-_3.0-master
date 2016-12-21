//
//  ViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "ViewController.h"
#import "OneController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor orangeColor];    
//    UIView *back = [[UIView alloc]init];
//    back.tag = 1000;
//    back.backgroundColor = [UIColor redColor];
//    back.x = 100;
//    back.y = 100;
//    back.width = 100;
//    back.height = 100;
//    
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taps)];
//    [back addGestureRecognizer:gesture];
//    [self.trysScrolls addSubview:back];
    
}

#pragma mark  ------------------- 返回导航栏标题
- (NSString *)titles
{

  return @"失领中心";
}
- (NSString *)types
{

    return @"ones";
    
}
- (void)taps
{
    
    
    OneController *one = [[OneController alloc]init];
     [self.navigationController pushViewController:one animated:YES];
    
    
}
@end
