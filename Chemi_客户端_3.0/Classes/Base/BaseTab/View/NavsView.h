//
//  NavsView.h
//  iOS_客户端
//
//  Created by ju on 16/9/8.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavsView : UIView

@property (strong, nonatomic) IBOutlet UILabel *title;

+ (instancetype)returnsNavViews;
@end
