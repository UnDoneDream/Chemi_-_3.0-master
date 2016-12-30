  //
//  ShowPersonCenter.m
//  Chemi_客户端_3.0
//
//  Created by 爱爱远人村 on 16/12/28.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "ShowPersonCenter.h"
#import "ReputationValueCell.h"

static NSString *const ID = @"cell";
@interface ShowPersonCenter ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *defineTable;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIButton *iconBtn;
@property (strong,nonatomic) UILabel *zanLabel;

@end

@implementation ShowPersonCenter

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavUI];
    
    [self defineTable];
    
    [self setMainUI];
    
    
}
#pragma mark ---------------------------- NAV SETTING ------------------------
- (void)setNavUI
{

    [self setRightItemTitle:@"举报/收藏" action:@selector(rightMethod)];

}
#pragma mark ---------------------------- Main UI set -------------------------
- (void)setMainUI
{
    
    self.defineTable.tableHeaderView = self.headerView;
    

}
- (void)rightMethod
{


    CNLog(@"举报/收藏");
    
}

#pragma mark --------------------- UITableView Delegate And DataSource Method ------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return section == 0 ?2:3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning message 这里的动态有一个状态标记，是否已经被领取了
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    ReputationValueCell *cells = [ReputationValueCell returnOneCreatSuccessCell:tableView];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 1) {
            
            cells.backgroundColor = [UIColor orangeColor];
               return cells;
        }else
        {
        
            return cell;
        }
     
    }else
    {
         cell.textLabel.text = @"于xxx捡到钱包一个";
         return cell;
    }

    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    if (section == 0) {
     
        return @"最近一次发表状态";
        
    }else
    {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 30;
    }else
    {
    
        return 10;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            return 50;
        }else
        {
        return 100;
        }
    }else
    {
    
        return 50;
    }
  

}


#pragma mark --------------------- Lazy Loading UI and Datas ----------------
- (NSString *)titles
{

 return @"个人主页";
}

- (UITableView *)defineTable
{
    if (!_defineTable) {
        _defineTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _defineTable.delegate = self;
        _defineTable.dataSource = self;
        _defineTable.backgroundView = [[UIImageView alloc]initWithImage:IMAGE_NAMED(@"person_back")];
        _defineTable.tableFooterView = [[UIView alloc]init];
        [self.view addSubview:_defineTable];
    }
    return _defineTable;
}
- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CNScreenWidth, 200)];
        UIImageView *back = [[UIImageView alloc]initWithFrame:_headerView.bounds];
        back.userInteractionEnabled = YES;
        back.image = IMAGE_NAMED(@"person_center_headerview");
        [_headerView addSubview:back];
        
        
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconBtn setImage:IMAGE_NAMED(@"icons") forState:UIControlStateNormal];
        [_iconBtn setImage:IMAGE_NAMED(@"person_icons") forState:UIControlStateHighlighted];
        [_iconBtn addTarget:self action:@selector(iconMethod) forControlEvents:UIControlEventTouchUpInside];
        [_iconBtn.layer setCornerRadius:40];
        [_iconBtn.layer setMasksToBounds:YES];
        [back addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(80);
            make.left.mas_equalTo(_headerView).mas_offset(14);
            make.top.mas_equalTo(_headerView).mas_offset(60);
        }];
        
        _zanLabel = [[UILabel alloc]init];
        _zanLabel.font = SYSTEM_FONT(13);
        [_zanLabel.layer setCornerRadius:4.0];
        _zanLabel.layer.borderWidth = 1.0;
        _zanLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _zanLabel.textColor = CNDefaultColor;
        _zanLabel.text = @"今日被赞:1000";
        [back addSubview:_zanLabel];
       [_zanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          
           make.left.mas_equalTo(_iconBtn);
           make.height.mas_equalTo(30);
           make.top.mas_equalTo(_iconBtn.mas_bottom).mas_offset(5);
           make.width.mas_offset(100);
       }];
        
        
        UILabel *sex = [[UILabel alloc]init];
        sex.backgroundColor = [UIColor redColor];
        sex.font = SYSTEM_FONT(13);
        sex.textColor = CNDefaultColor;
        sex.text = @"is 男男男男男";
        [back addSubview:sex];
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.mas_equalTo(back).mas_offset(-14);
            make.firstBaseline.mas_equalTo(_iconBtn).mas_offset(10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            
        }];
#warning message --- 这里到时候算出text字体的宽
        UILabel *address = [[UILabel alloc]init];
        address.backgroundColor = [UIColor redColor];
        address.font = SYSTEM_FONT(13);
        address.textColor = CNDefaultColor;
        address.text = @"贵州省-贵阳市";
        [back addSubview:address];
        [address mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.right.mas_equalTo(sex);
            make.top.mas_equalTo(sex.mas_bottom).mas_offset(10);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(30);
            
            
        }];
        
        UILabel *profession = [[UILabel alloc]init];
        profession.backgroundColor = [UIColor redColor];
        profession.font = SYSTEM_FONT(13);
        profession.textColor = CNDefaultColor;
        profession.text = @"职业:老师";
        [back addSubview:profession];
        [profession mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.mas_equalTo(address);
            make.top.mas_equalTo(address.mas_bottom).mas_offset(10);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(30);
        
        }];
        
        
        
        
        
    }
    return _headerView;
}
- (void)iconMethod
{

    CNLog(@"头像点击事件");

}
@end
