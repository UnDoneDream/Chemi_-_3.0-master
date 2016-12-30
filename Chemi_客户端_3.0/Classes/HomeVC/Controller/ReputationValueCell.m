//
//  ReputationValueCell.m
//  Chemi_客户端_3.0
//
//  Created by 爱爱远人村 on 16/12/30.
//  Copyright © 2016年 ju. All rights reserved.
//
static NSString *const ID = @"reput";
#import "ReputationValueCell.h"

@implementation ReputationValueCell


+ (instancetype)returnOneCreatSuccessCell:(UITableView *)tableView
{
    ReputationValueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[ReputationValueCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }

    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    
    
    UIButton *reputation = [UIButton buttonWithType:UIButtonTypeCustom];
    reputation.backgroundColor = [UIColor redColor];
    [reputation.titleLabel setFont:SYSTEM_FONT(13)];
    [reputation setTitle:@"信誉值" forState:UIControlStateNormal];
    [self.contentView addSubview:reputation];
    
    [reputation mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(6);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(6);
    }];

    UIView *progresss = [[UIView alloc]init];
    progresss.backgroundColor = CNColor(82, 207, 107);
    [self.contentView addSubview:progresss];
    [progresss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(6);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-6);
    }];
    
    UILabel *person = [[UILabel alloc]init];
    person.font = SYSTEM_FONT(16);
    person.backgroundColor = [UIColor grayColor];
    person.textColor = [UIColor whiteColor];
    person.text = @"%50";
    [self.contentView addSubview:person];
    [person mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(progresss.mas_right).mas_offset(4);
        make.bottom.mas_equalTo(progresss.mas_bottom);
        
    }];
    
    
}

@end
