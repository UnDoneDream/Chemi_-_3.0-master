//
//  unLoginView.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "unLoginView.h"

@interface unLoginView ()

@property (strong, nonatomic) UIButton *unLoginButton;

@end

@implementation unLoginView

+ (instancetype)unLoginViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.unLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.unLoginButton.backgroundColor = CNColor(67,199,176);
    [self.unLoginButton setTitle:@"立即登录" forState:UIControlStateNormal];
    [self.unLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.unLoginButton addTarget:self action:@selector(gotoLoginVC) forControlEvents:UIControlEventTouchUpInside];
    
    //设置button圆角
    self.unLoginButton.layer.cornerRadius = 2.5;
    self.unLoginButton.layer.masksToBounds = YES;
    
    [self addSubview:self.unLoginButton];
    
    //给view增加约束条件
    [self.unLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).with.offset(100);
//        make.right.equalTo(self).with.offset(-100);
        make.center.equalTo(self);
        make.height.mas_equalTo(@34);
        make.width.mas_equalTo(@100);
    }];
}

- (void)gotoLoginVC
{
    CNLog(@"立即登录");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
