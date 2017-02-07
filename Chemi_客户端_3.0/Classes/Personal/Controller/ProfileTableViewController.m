//
//  ProfileTableViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "SettingViewController.h"


#define tableHeaderViewHeight 200


@interface ProfileTableViewController ()<UITableViewDelegate, UITableViewDataSource, unLoginViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *tableData;

@property (nonatomic,assign) BOOL isLogin;

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.isLogin = false;
    [self setNavBar];
    [self setTableHeaderView];
}
#pragma mark  ------------------- 设置导航栏
- (NSString *)titles
{
    return @"管理中心";
}

- (void)setNavBar
{
    [self setRightItemTitle:@"设置" titleColor:[UIColor whiteColor] action:@selector(gotoSettingVC)];
}


#pragma mark ------------------- 事件处理部分
- (void)gotoSettingVC
{
    CNLog(@"设置");
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self pushVC:setting];
}

#pragma mark ------------------- 内部调用方法部分
- (void)setTableHeaderView
{
    if (self.isLogin) {
        LoginedView *logined = [LoginedView LoginedViewWithFrame:CGRectMake(0, 0, CNScreenWidth, tableHeaderViewHeight) icon:[UIImage imageNamed:@"22131"] name:@"哈哈哈哈"];
        self.tableView.tableHeaderView = logined;
    }else{
        unLoginView *unLogin = [unLoginView unLoginViewWithFrame:CGRectMake(0, 0, CNScreenWidth, tableHeaderViewHeight)];
        unLogin.unLoginDelegate = self;
        self.tableView.tableHeaderView = unLogin;
    }
}

#pragma mark  ------------------- UITableViewDataSource代理方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableData.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowArray = self.tableData[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *rowArray = self.tableData[indexPath.section];
    RootPersonalTableViewCell *cell = [RootPersonalTableViewCell RootPersonalTableViewCellWithTableView:tableView];
    [cell setDict:rowArray[indexPath.row]];
    return cell;
}

#pragma mark  ------------------- UITableViewDelegate代理方法

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CNLog(@"点击了第%ld-%ld个cell",indexPath.section, indexPath.row);
}

#pragma mark  ------------------- 自定义代理方法实现
- (void)unLoginViewDelegateToLoginVC
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self pushVC:loginVC];
}


#pragma mark  ------------------- 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CNScreenBounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.scrollEnabled = NO;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSArray *)tableData
{
    if (!_tableData) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"发布过"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"星级过的人"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"历史沟通"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict4 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"收藏"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict5 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"分享"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict6 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"游戏"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict7 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"活动"]
                                                         forKeys:@[@"icon", @"title"]];
        NSDictionary *dict8 = [NSDictionary dictionaryWithObjects:@[@"uc_order", @"天气"]
                                                         forKeys:@[@"icon", @"title"]];
        _tableData = [NSArray arrayWithObjects:@[dict, dict2, dict3, dict4, dict5], @[dict6, dict7, dict8], nil];
    }
    return _tableData;
}

@end
