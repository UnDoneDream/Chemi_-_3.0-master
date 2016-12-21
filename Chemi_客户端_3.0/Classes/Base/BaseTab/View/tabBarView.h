//
//  tabBarView.h
//  ItcastWeibo
//
//  Created by ma c on 15/10/19.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tabBarView;
@protocol tabBarViewDelegate <NSObject>

@optional
- (void)taBar:(tabBarView *)taBar didSelectButtonFrom:(NSInteger)from from:(NSInteger)to;

@end
@interface tabBarView : UIView


- (void)addTabButtonWithItem:(UITabBarItem *)item;
@property (weak,nonatomic) id<tabBarViewDelegate> delegat;
@end
