//
//  ViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//
#define ones 1
#define corne 4.0
#define twos 2
#define threes 3
#import "ViewController.h"
static NSString *const ID = @"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

#pragma mark --------------- 头部部分
@property (strong,nonatomic) UIView *segment;
@property (strong,nonatomic) UIButton *selectBtn;
@property (weak,nonatomic) UIView *selectView;


#pragma mark --------------- 列表部分,底部
@property (strong,nonatomic) UITableView *listTableView_1;
@property (strong,nonatomic) UITableView *listTableView_2;

@property (strong,nonatomic) UIView *back_1;
@property (strong,nonatomic) UIView *back_2;



#pragma mark --------------  数据存储部分
@property (strong,nonatomic) NSMutableArray *saveDatas;


@property (copy,nonatomic) NSString *onesss;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self segment];
    
    [self creatBtnLocationTitleView];
    
    [self back_1];
    
    [self listTableView_1];
    
    [self back_2];
    
    [self listTableView_2];
}
#pragma MARK --------------------------- 头部部分 ------------------------
- (void)creatBtnLocationTitleView
{
   
    //分段控制器
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"捡到",@"丢失"]];
    segment.frame = CGRectMake(0, 0, 200, 30);
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    
    [segment setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    [segment setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    
    self.navigationItem.titleView = segment;
    
    [segment addTarget:self action:@selector(segmentChangePage:) forControlEvents:UIControlEventValueChanged];


    [self setRightImageNamed:@"main_search_white" action:@selector(searchInfomation)];
    
    UIView *selectView = [[UIView alloc]initWithFrame:CGRectMake(Zeros, Zeros, CNScreenWidth, 50)];
    selectView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:selectView];
    self.selectView = selectView;
    
    UIButton *des = [UIButton buttonWithType:UIButtonTypeCustom];
    des.frame = selectView.bounds;
    [des setTitle:@"这里是省市县区选择器" forState:UIControlStateNormal];
    [selectView addSubview:des];
    
    
}
#pragma mark ---------------------------- 头部部分的点击事件 ------------------------
- (void)searchInfomation
{

    SearchVC *search = [SearchVC new];
    [self pushVC:search];
    
}
- (void)segmentChangePage:(UISegmentedControl *)sender
{
  
    
    if (sender.selectedSegmentIndex == 0) {
        self.back_1.hidden = NO;
        self.back_2.hidden = YES;
        
    }else
    {
        
        self.back_1.hidden = YES;
        self.back_2.hidden = NO;
      
    }
    
}


#pragma mark  ------------------- 返回导航栏标题
- (NSString *)titles
{

  return @"失领中心";
}
#pragma mark ------------------------ TableView DataSource Method -----------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.imageView.image = IMAGE_NAMED(@"icons");
    cell.textLabel.font = SYSTEM_FONT(16);
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.text = @"我鱼xxxx在xxxx丢了xxxx      10:90";
    
    return cell;
}

#pragma mark ------------------------ UITableView Delegate ----------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    CNLog(@"选中第%zd行",indexPath.row);
    
}
#pragma mark ------------------------UI lazy loading ----------------------
- (UIView *)segment
{
    if (!_segment) {
        _segment = [[UIView alloc]initWithFrame:CGRectMake(Zeros, Zeros, CNScreenWidth/twos, 40)];
        _segment.backgroundColor = [UIColor clearColor];
        _segment.layer.cornerRadius = corne;
        self.navigationItem.titleView = _segment;
    }
    return _segment;
}
- (UIView *)back_1
{
    if (!_back_1) {
        _back_1 = [[UIView alloc]initWithFrame:CGRectMake(Zeros,CGRectGetMaxY(self.selectView.frame), CNScreenWidth,CNScreenHeight - CGRectGetMaxY(self.selectView.frame))];
        _back_1.hidden = NO;
        [self.view addSubview:_back_1];
    }

    return _back_1;
}
- (UIView *)back_2
{
    if (!_back_2) {
        _back_2 = [[UIView alloc]initWithFrame:CGRectMake(Zeros,CGRectGetMaxY(self.selectView.frame), CNScreenWidth,CNScreenHeight - CGRectGetMaxY(self.selectView.frame))];
        _back_2.backgroundColor = [UIColor blueColor];
        _back_2.hidden = YES;
        [self.view addSubview:_back_2];
    }
    
    return _back_2;
}
- (UITableView *)listTableView_1
{
    if (!_listTableView_1) {
        _listTableView_1 = [[UITableView alloc]initWithFrame:self.back_1.bounds style:UITableViewStylePlain];
        _listTableView_1.contentInset = CNUIEdgeALL(Zeros, Zeros, 120, Zeros);
        _listTableView_1.delegate = self;
        _listTableView_1.dataSource = self;
        _listTableView_1.rowHeight = 60;
        _listTableView_1.tableFooterView = [[UIView alloc]init];
        [self.back_1 addSubview:_listTableView_1];
    }
    return _listTableView_1;
}

- (UITableView *)listTableView_2
{
    if (!_listTableView_2) {
        _listTableView_2 = [[UITableView alloc]initWithFrame:self.back_1.bounds style:UITableViewStylePlain];
        _listTableView_2.contentInset = CNUIEdgeALL(Zeros, Zeros, 120, Zeros);
        _listTableView_2.delegate = self;
        _listTableView_2.dataSource = self;
        _listTableView_2.rowHeight = 60;
        _listTableView_2.tableFooterView = [[UIView alloc]init];
        [self.back_2 addSubview:_listTableView_2];
    }
    return _listTableView_2;
}

#pragma mark ------------------------ Data lazy loading ---------------------
- (NSMutableArray *)saveDatas
{
    if (!_saveDatas) {
        _saveDatas = [NSMutableArray array];
    }
    return _saveDatas;
}

@end
