//
//  PersonChat.m
//  Chemi_客户端_3.0
//
//  Created by 爱爱远人村 on 17/1/10.
//  Copyright © 2017年 ju. All rights reserved.
//
#warning messgae --------  点击用户头像做一系列的操作
#import "PersonChat.h"

@interface PersonChat ()

@end

@implementation PersonChat

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *backImages = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImages.image = [UIImage imageNamed:@"chat"];
    [self.view addSubview:backImages];
    
}
- (NSString *)titles
{

 return @"与它交谈";
}
@end
