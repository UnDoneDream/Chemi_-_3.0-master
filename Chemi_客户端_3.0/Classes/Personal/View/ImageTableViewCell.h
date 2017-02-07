//
//  ImageTableViewCell.h
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 17/2/6.
//  Copyright © 2017年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *iconImageView;

+ (instancetype) imageTableViewCellWithTableView:(UITableView *)tableView;

@end
