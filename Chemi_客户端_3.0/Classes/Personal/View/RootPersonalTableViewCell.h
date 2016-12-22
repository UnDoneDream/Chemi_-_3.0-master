//
//  RootPersonalTableViewCell.h
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootPersonalTableViewCell : UITableViewCell

///头像label；
@property (strong, nonatomic) UIImageView *iconImageView;
///标题label
@property (strong, nonatomic) UILabel *titleLabel;
///数量label,暂时不显示
@property (strong, nonatomic) UILabel *countLabel;

///初始化cell
+ (instancetype) RootPersonalTableViewCellWithTableView:(UITableView *)tableView;

///设置cell数据
- (void)setDict:(NSDictionary *)dict;
@end
