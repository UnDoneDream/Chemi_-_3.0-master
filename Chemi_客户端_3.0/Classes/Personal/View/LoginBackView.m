//
//  LoginBackView.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/23.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "LoginBackView.h"

#define circleRadius 60

@interface LoginBackView ()
{
    CGFloat _viewWidth;
    CGFloat _viewHeight;
    CGContextRef context;
}

@property (weak, nonatomic) UIView *emailBackView;
@property (weak, nonatomic) UIImageView *emailImageView;
@property (weak, nonatomic) UITextField *emailTextField;
@property (weak, nonatomic) UIView *lineView;
@property (weak, nonatomic) UIView *passwordBackView;
@property (weak, nonatomic) UIImageView *passwordImageView;
@property (weak, nonatomic) UITextField *passwordTextField;



@end

@implementation LoginBackView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _viewWidth = frame.size.width;
        _viewHeight = frame.size.height;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, _viewWidth, 0);
    CGContextAddLineToPoint(context, _viewWidth, _viewHeight / 3 - 5);
    CGContextAddArc(context, _viewWidth, _viewHeight / 2, circleRadius / 2, -M_PI_2, M_PI_2, 1);
    CGContextAddLineToPoint(context, _viewWidth, _viewHeight);
    CGContextAddLineToPoint(context, 0, _viewHeight);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillPath(context);
    
    [self createUI];
    
//    [self createUI];
}

- (void)createUI
{
    UIView *emailBackView = [UIView new];
    emailBackView.backgroundColor = [UIColor redColor];
    self.emailBackView = emailBackView;
    
    UIImageView *emailImageView = [UIImageView new];
    emailImageView.image = [UIImage imageNamed:@""];
    emailImageView.backgroundColor = [UIColor yellowColor];
    self.emailImageView = emailImageView;
    
    UITextField *emailTextField = [UITextField new];
    emailTextField.placeholder = @"邮箱地址";
    emailTextField.backgroundColor = [UIColor yellowColor];
    self.emailTextField = emailTextField;

    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor redColor];
    self.lineView = lineView;
    
    UIView *passwordBackView = [UIView new];
    passwordBackView.backgroundColor = [UIColor redColor];
    self.passwordBackView = passwordBackView;
    
    UIImageView *passwordImageView = [UIImageView new];
    passwordImageView.backgroundColor = [UIColor yellowColor];
    passwordImageView.image = [UIImage imageNamed:@""];
    self.passwordImageView = passwordImageView;
    
    UITextField *passwordTextField = [UITextField new];
    passwordTextField.backgroundColor = [UIColor yellowColor];
    passwordTextField.placeholder = @"请输入密码";
    passwordTextField.secureTextEntry = YES;
    self.passwordTextField = passwordTextField;
    
    [self addViewToSuperView];
    
    [self setViewMasonry];
}

- (void)addViewToSuperView
{
    [self addSubview:self.emailBackView];
    [self.emailBackView addSubview:self.emailImageView];
    [self.emailBackView addSubview:self.emailTextField];
    [self addSubview:self.lineView];
    [self addSubview:self.passwordBackView];
    [self.passwordBackView addSubview:self.passwordImageView];
    [self.passwordBackView addSubview:self.passwordTextField];

}

- (void)setViewMasonry
{
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(10);
        make.width.mas_equalTo(@(_viewWidth - circleRadius / 2 - 10 - 10));
        make.height.mas_equalTo(@1);
    }];
    
    [self.emailBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(20);
        make.left.equalTo(self.lineView.mas_left);
        make.right.equalTo(self.lineView.mas_right);
        make.height.mas_equalTo(@35);
        make.bottom.equalTo(self.lineView.mas_top).with.offset(-20);
    }];
    
    [self.emailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.emailBackView).with.offset(0);
        make.top.equalTo(self.emailBackView).with.offset(5);
        make.bottom.equalTo(self.emailBackView).with.offset(-5);
        make.width.mas_equalTo(@30);
    }];

    [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.emailImageView.mas_centerY);
        make.left.equalTo(self.emailImageView.mas_right).with.offset(10);
        make.right.equalTo(self.emailBackView).with.offset(0);
    }];
    
    [self.passwordBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).with.offset(20);
        make.left.equalTo(self.emailBackView.mas_left);
        make.right.equalTo(self.emailBackView.mas_right);
        make.bottom.equalTo(self).with.offset(-20);
    }];
    
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordBackView);
        make.top.equalTo(self.passwordBackView).with.offset(5);
        make.bottom.equalTo(self.passwordBackView).with.offset(-5);
        make.width.mas_equalTo(@30);
    }];

    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordImageView.mas_centerY);
        make.left.equalTo(self.passwordImageView.mas_right).with.offset(10);
        make.right.equalTo(self.passwordBackView);
    }];
}

@end
