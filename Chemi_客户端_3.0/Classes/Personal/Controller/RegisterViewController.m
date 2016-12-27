//
//  RegisterViewController.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/26.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (strong, nonatomic) UIView *registerBackView;

@property (weak, nonatomic) UIView *phoneBackView;
@property (weak, nonatomic) UIImageView *phoneImageView;
@property (weak, nonatomic) UITextField *phoneTextField;
@property (weak, nonatomic) UIView *lineView1;

@property (weak, nonatomic) UIView *codeBackView;
@property (weak, nonatomic) UITextField *codeTextField;
@property (weak, nonatomic) UIButton *codeButton;
@property (weak, nonatomic) UIView *lineView2;

@property (weak, nonatomic) UIView *passwordBackView;
@property (weak, nonatomic) UIImageView *passwordImageView;
@property (weak, nonatomic) UITextField *passwordTextField;
@property (weak, nonatomic) UIView *lineView3;

@end

@implementation RegisterViewController

- (NSString *)titles
{
    return @"注册";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self createUI];
}

- (void)createUI
{
    self.registerBackView = [UIView new];
    
    UIView * phoneBackView= [UIView new];
    phoneBackView.backgroundColor = [UIColor redColor];
    self.phoneBackView = phoneBackView;
    
    UIImageView *phoneImageView = [UIImageView new];
    phoneImageView.image = [UIImage imageNamed:@""];
    phoneImageView.backgroundColor = [UIColor yellowColor];
    self.phoneImageView = phoneImageView;
    
    UITextField *phoneTextField = [UITextField new];
    phoneTextField.placeholder = @"请输入手机号码";
    phoneTextField.backgroundColor = [UIColor yellowColor];
    self.phoneTextField = phoneTextField;
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = [UIColor redColor];
    self.lineView1 = lineView1;
    
    UIView * codeBackView= [UIView new];
    codeBackView.backgroundColor = [UIColor redColor];
    self.codeBackView = codeBackView;
    
    UITextField *codeTextField = [UITextField new];
    codeTextField.placeholder = @"请输入验证码";
    codeTextField.backgroundColor = [UIColor yellowColor];
    self.codeTextField = codeTextField;
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.codeButton = codeButton;
    
    UIView *lineView2 = [UIView new];
    lineView2.backgroundColor = [UIColor redColor];
    self.lineView2 = lineView2;
    
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
    
    UIView *lineView3 = [UIView new];
    lineView3.backgroundColor = [UIColor redColor];
    self.lineView3 = lineView3;
    
    [self addViewToSuperView];
    
    [self setViewMasonry];
    
}

- (void)addViewToSuperView
{
    [self.view addSubview:self.registerBackView];
    [self.view addSubview:self.phoneBackView];
    [self.view addSubview:self.codeBackView];
    [self.view addSubview:self.passwordBackView];
    [self.view addSubview:self.lineView1];
    [self.view addSubview:self.lineView2];
    [self.view addSubview:self.lineView3];
    
    [self.phoneBackView addSubview:self.phoneImageView];
    [self.phoneBackView addSubview:self.phoneTextField];
    [self.codeBackView addSubview:self.codeTextField];
    [self.codeBackView addSubview:self.codeButton];
    [self.passwordBackView addSubview:self.passwordImageView];
    [self.passwordBackView addSubview:self.passwordTextField];
}

- (void)setViewMasonry
{
    [self.registerBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
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
