//
//  NavsView.m
//  iOS_客户端
//
//  Created by ju on 16/9/8.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "NavsView.h"

@interface NavsView()


@end

@implementation NavsView

+ (instancetype)returnsNavViews
{

  return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil
                                      options:nil] lastObject];
}
@end
