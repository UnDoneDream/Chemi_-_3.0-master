//
//  RootPersonalTableViewCell.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 16/12/22.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "RootPersonalTableViewCell.h"

@implementation RootPersonalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark  ---------------------UI部分
+ (instancetype) RootPersonalTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *rid=@"rootCell";
    RootPersonalTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[RootPersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.titleLabel];
    
    self.countLabel = [[UILabel alloc] init];
    self.countLabel.hidden = YES;
    self.countLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.countLabel];
    
    [self setViewMasonry];
}

#pragma mark --------------------------view增加约束条件
- (void)setViewMasonry
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(7.5);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(@18);
    }];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(0);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(@18);
    }];
}

#pragma mark  -------------------------数据处理部分

- (void)setDict:(NSDictionary *)dict
{
    self.iconImageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.titleLabel.text = dict[@"title"];
    self.countLabel.text = @"10";
    [self.titleLabel sizeToFit];
    [self.countLabel sizeToFit];
}

@end
