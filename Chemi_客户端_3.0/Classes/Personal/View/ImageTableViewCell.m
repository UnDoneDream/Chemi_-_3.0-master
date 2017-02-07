//
//  ImageTableViewCell.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 17/2/6.
//  Copyright © 2017年 ju. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

+ (instancetype) imageTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *rid=@"imageCell";
    ImageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[ImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
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
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    
    self.iconImageView = [UIImageView new];
    self.iconImageView.backgroundColor = [UIColor blueColor];
    self.iconImageView.layer.cornerRadius = 17;
    self.iconImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.iconImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(15);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.width.mas_equalTo(@34);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
