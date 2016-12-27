//
//  unLoginView.h
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol unLoginViewDelegate <NSObject>

- (void)unLoginViewDelegateToLoginVC;

@end

@interface unLoginView : UIView

@property (weak, nonatomic) id<unLoginViewDelegate> unLoginDelegate;

+ (instancetype) unLoginViewWithFrame:(CGRect)frame;


@end
