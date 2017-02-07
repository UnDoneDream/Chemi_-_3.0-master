//
//  CutView.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 17/2/6.
//  Copyright © 2017年 ju. All rights reserved.
//

#import "CutView.h"

@interface CutView ()
{
    CGPoint viewCenter;
}

@end

@implementation CutView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        viewCenter = self.center;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [super drawRect:rect];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextBeginPath(contextRef);
    CGContextMoveToPoint(contextRef, 0, 0);
    CGContextAddLineToPoint(contextRef, 0, viewCenter.y);
    CGContextAddLineToPoint(contextRef, viewCenter.x - 50, viewCenter.y);
    CGContextAddArc(contextRef, viewCenter.x, viewCenter.y, 50, M_PI, 0, 0);
    CGContextAddLineToPoint(contextRef, self.frame.size.width, viewCenter.y);
    CGContextAddLineToPoint(contextRef, self.frame.size.width, 0);
    CGContextAddLineToPoint(contextRef, 0, 0);
    [[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5] set];
    CGContextFillPath(contextRef);
    
//    CGContextBeginPath(contextRef);
    
    CGContextMoveToPoint(contextRef, 0, self.frame.size.height);
    CGContextAddLineToPoint(contextRef, 0, viewCenter.y);
    CGContextAddLineToPoint(contextRef, viewCenter.x - 50, viewCenter.y);
    CGContextAddArc(contextRef, viewCenter.x, viewCenter.y, 50, M_PI, 0, 1);
    CGContextAddLineToPoint(contextRef, self.frame.size.width, viewCenter.y);
    CGContextAddLineToPoint(contextRef, self.frame.size.width, self.frame.size.height);
    
    CGContextAddLineToPoint(contextRef, 0, self.frame.size.height);
    [[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5] set];
    CGContextFillPath(contextRef);
//    CGContextStrokePath(contextRef);
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    [[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5] set];
//    CGContextFillRect(contextRef, rect);
//    
//    CGContextAddEllipseInRect(contextRef, CGRectMake(viewCenter.x - 50, viewCenter.y - 50, 100, 100));
//    [[UIColor yellowColor] set];
//    CGContextFillPath(contextRef);
}


@end
