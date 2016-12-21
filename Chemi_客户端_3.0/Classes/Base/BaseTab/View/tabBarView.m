//
//  tabBarView.m
//  ItcastWeibo
//
//  Created by ma c on 15/10/19.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "tabBarView.h"
#import "CMTabButton.h"
@interface tabBarView()

@property (strong,nonatomic) CMTabButton *selectButton;

@end
@implementation tabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

- (void)addTabButtonWithItem:(UITabBarItem *)item
{

    CMTabButton *button = [[CMTabButton alloc]init];
//    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:button];
    //2.设置数据
    button.item = item;

    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];

    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}
- (void)buttonClick:(CMTabButton *)button
{
    //1.通知代理
    if ([self.delegat respondsToSelector:@selector(taBar:didSelectButtonFrom:from:)]) {
        [self.delegat taBar:self didSelectButtonFrom:self.selectButton.tag from:button.tag];
    }
 
    //2.确定按钮状态
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
  
}

- (void)layoutSubviews
{
    [super layoutSubviews];
      
    for (int i = 0; i<self.subviews.count; i++) {
        CMTabButton *button = self.subviews[i];
        CGFloat y = 0;
        CGFloat w = self.frame.size.width/self.subviews.count;
        CGFloat h = self.frame.size.height;
        CGFloat x = i * w;
        button.tag = i;
        
        button.frame = CGRectMake(x, y, w, h);
        
    }
}
@end
