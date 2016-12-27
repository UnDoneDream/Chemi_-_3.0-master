//
//  LoginedView.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "LoginedView.h"

@interface LoginedView ()
{
    UIImage *_icon;
    NSString *_name;
    
}

@property (strong, nonatomic) UIView *backView;
///用户头像
@property (strong, nonatomic) UIImageView *iconImageView;
///用户名label
@property (strong, nonatomic) UILabel *nameLabel;
///箭头imgView
@property (strong, nonatomic) UIImageView *arrowImageView;
///贡献值按钮
@property (strong, nonatomic) UIButton *contributeButton;
///信用值按钮
@property (strong, nonatomic) UIButton *creditButton;

@end

@implementation LoginedView

+ (instancetype) LoginedViewWithFrame:(CGRect)frame icon:(UIImage *)icon name:(NSString *)name
{
    return [[self alloc] initWithFrame:frame icon:icon name:name];
}

- (instancetype) initWithFrame:(CGRect)frame icon:(UIImage *)icon name:(NSString *)name
{
    if (self = [super initWithFrame:frame]) {
        _icon = icon;_name = name;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor purpleColor];
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.backgroundColor = [UIColor redColor];
    self.iconImageView.layer.cornerRadius = 32;
    self.iconImageView.layer.masksToBounds = YES;
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"高宇husdda";
    self.nameLabel.backgroundColor = [UIColor redColor];
    
    self.arrowImageView = [[UIImageView alloc] init];
    self.arrowImageView.backgroundColor = [UIColor redColor];
    
    //贡献值按钮
    self.contributeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.contributeButton.tag = 10001;
    self.contributeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contributeButton setTitle:@"贡献值100" forState:UIControlStateNormal];
    [self.contributeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.contributeButton addTarget:self action:@selector(loginedTwoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.contributeButton.layer.cornerRadius = 2.5;
    self.contributeButton.layer.borderWidth = 1.0;
    self.contributeButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.contributeButton.layer.masksToBounds = YES;
    //信用值按钮
    self.creditButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.creditButton.tag = 10002;
    self.creditButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.creditButton setTitle:@"信用分值100" forState:UIControlStateNormal];
    [self.creditButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.creditButton addTarget:self action:@selector(loginedTwoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.creditButton.layer.cornerRadius = 2.5;
    self.creditButton.layer.borderWidth = 1.0;
    self.creditButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.creditButton.layer.masksToBounds = YES;
    [self addViewToSuperView];
    [self setViewMasonry];
}

- (void)addViewToSuperView{
    [self addSubview:self.backView];
    [self.backView addSubview:self.iconImageView];
    [self.backView addSubview:self.nameLabel];
    [self.backView addSubview:self.arrowImageView];
    [self addSubview:self.contributeButton];
    [self addSubview:self.creditButton];
}

- (void)setViewMasonry
{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(@140);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@64);
        make.height.mas_equalTo(@64);
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.backView).with.offset(34);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.backView);
        make.height.mas_equalTo(@18);
    }];
    [self.nameLabel sizeToFit];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView).with.offset(-20);
        make.centerY.equalTo(self.backView);
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@20);
    }];
    
    [self.contributeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(74);
        make.top.equalTo(self.backView.mas_bottom).with.offset(10);
        make.height.mas_equalTo(@34);
    }];
    
    [self.creditButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-74);
        make.left.equalTo(self.contributeButton.mas_right).with.offset(20);
        make.top.equalTo(self.contributeButton);
        make.width.equalTo(self.contributeButton);
        make.height.equalTo(self.contributeButton);
    }];
}

- (void)loginedTwoBtnClick:(UIButton *)sender
{
    CNLog(@"点击了tag为%ld的按钮",sender.tag);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
