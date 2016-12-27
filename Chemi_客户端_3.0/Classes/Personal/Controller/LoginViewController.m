//
//  LoginViewController.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/23.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (NSString *)titles
{
    return @"登录";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self createUI];
}

- (void)createUI
{
    LoginBackView *loginView = [[LoginBackView alloc] initWithFrame:CGRectMake(30, 150, CNScreenWidth - 30 * 2 - 25, 150)];
    loginView.backgroundColor = [UIColor clearColor];
    loginView.layer.cornerRadius = 5.0;
    loginView.layer.masksToBounds = YES;
    [self.view addSubview:loginView];
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    goButton.tag = 20001;
    goButton.frame = CGRectMake(30 + loginView.frame.size.width - 25, 150 + loginView.frame.size.height / 2 - 25, 50, 50);
    [goButton setTitle:@"GO" forState:UIControlStateNormal];
    goButton.backgroundColor = [UIColor orangeColor];
    goButton.layer.cornerRadius = 25;
    goButton.layer.masksToBounds = YES;
    [goButton addTarget:self action:@selector(loginVCButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetButton.tag = 20002;
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(loginVCButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [forgetButton sizeToFit];
    [self.view addSubview:forgetButton];
    
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginView.mas_bottom).with.offset(10);
        make.right.equalTo(loginView.mas_right).with.offset(0);
        make.height.mas_equalTo(@34);
    }];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.tag = 20003;
    registerButton.titleLabel.font = [UIFont systemFontOfSize:26];
    [registerButton setTitle:@"注册新账号" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(loginVCButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    registerButton.layer.cornerRadius = 22.0;
    registerButton.layer.borderWidth = 1.0;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.layer.masksToBounds = YES;
    [self.view addSubview:registerButton];
    
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-150);
        make.left.equalTo(self.view).with.offset(84);
        make.right.equalTo(self.view).with.offset(-84);
        make.height.mas_equalTo(@44);
    }];
}

- (void)loginVCButtonClick:(UIButton *)sender
{
    NSLog(@"点击了tag = %ld的按钮",sender.tag);
    switch (sender.tag) {
        case 20001:{
            CNLog(@"登录");
            break;
        }
        case 20002:{
            CNLog(@"忘记密码");
            break;
        }
        case 20003:{
            RegisterViewController *registerVC = [[RegisterViewController alloc] init];
            [self hideBottomBarPush:registerVC];
            break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
