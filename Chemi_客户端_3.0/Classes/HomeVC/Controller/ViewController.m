//
//  ViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//
#define ones 1
#define corne 4.0
#define twos 2
#define threes 3
#import "ViewController.h"
@interface ViewController ()

#pragma mark --------------- 头部部分
@property (strong,nonatomic) UIView *segment;
@property (strong,nonatomic) UIButton *selectBtn;


#pragma mark --------------  数据存储部分
@property (strong,nonatomic) NSMutableArray *saveDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self segment];
    
    [self creatBtnLocationTitleView];
    
}
#pragma MARK --------------------------- 头部部分 ------------------------
- (void)creatBtnLocationTitleView
{
   
    NSArray *list = @[@"捡到",@"丢失"];
    for (int i = Zeros; i<list.count; i++) {
        
        self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectBtn.frame = CGRectMake(i*(self.segment.width/twos+ones)+ones, ones, self.segment.width/twos-threes, self.segment.height-twos);
        self.selectBtn.backgroundColor = CNColor(206, 206, 206);
        [self.selectBtn setTitle:list[i] forState:UIControlStateNormal];
        [self.selectBtn.titleLabel setFont:normalFont];
        [self.selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.selectBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self.selectBtn.layer setCornerRadius:corne];
        [self.segment addSubview:self.selectBtn];
  
    }
     
    [self setRightItemTitle:@"搜索" action:@selector(searchInfomation)];
    
    
}
- (void)searchInfomation
{


    CNLog(@"搜索");

}

#pragma mark  ------------------- 返回导航栏标题
- (NSString *)titles
{

  return @"失领中心";
}


#pragma mark ------------------------UI lazy loading ----------------------
- (UIView *)segment
{
    if (!_segment) {
        _segment = [[UIView alloc]initWithFrame:CGRectMake(Zeros, Zeros, CNScreenWidth/twos, 40)];
        _segment.backgroundColor = [UIColor clearColor];
        _segment.layer.cornerRadius = corne;
        self.navigationItem.titleView = _segment;
    }
    return _segment;
}

#pragma mark ------------------------ Data lazy loading ---------------------
- (NSMutableArray *)saveDatas
{
    if (!_saveDatas) {
        _saveDatas = [NSMutableArray array];
    }
    return _saveDatas;
}

@end
