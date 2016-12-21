//
//  UIButton+block.h
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/11.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (block)

@property (nonatomic, copy) NSString *Type;

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
