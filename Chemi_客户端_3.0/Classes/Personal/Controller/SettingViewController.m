//
//  SettingViewController.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 17/2/6.
//  Copyright © 2017年 ju. All rights reserved.
//

#import "SettingViewController.h"
#import "CutImageViewController.h"
#import "ImageTableViewCell.h"
@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *tableData;

@end

@implementation SettingViewController

- (NSString *)titles
{
    return @"设置";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    UIButton *goOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //45,114,255
    goOutButton.frame = CGRectMake(10, CGRectGetMaxY(self.tableView.frame) + 84, CNScreenWidth - 20, 44);
    [goOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [goOutButton setTitleColor:CNColor(45, 114, 255) forState:UIControlStateNormal];
    goOutButton.layer.cornerRadius = 2.5;
    goOutButton.layer.borderWidth = 1.0;
    goOutButton.layer.borderColor = CNColor(45, 114, 255).CGColor;
    goOutButton.layer.masksToBounds = YES;
    [self.view addSubview:goOutButton];
}
#pragma mark ------------------- tableView代理实现部分
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.tableData[indexPath.row];
    if (indexPath.row == 0) {
        ImageTableViewCell *cell = [ImageTableViewCell imageTableViewCellWithTableView:tableView];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = dict[@"title"];
        return cell;
    }else{
        static NSString *rid=@"titleCell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = dict[@"title"];
        cell.detailTextLabel.text = dict[@"desc"];
        return cell;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CNLog(@"点击了%@",indexPath);
    switch (indexPath.row) {
        case 0:{
            [self showAlertView];
            break;
        }
        case 1:{
            
            break;
        }
        case 2:{
            
            break;
        }
        case 3:{
            
            break;
        }
        case 4:{
            
            break;
        }
        case 5:{
            
            break;
        }
        default:{
            
            break;
        }
    }
}

#pragma mark ---------------------------------imagePickerController代理方法实现

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    CNLog(@"info = %@",info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    CNLog(@"%@",image);
    CutImageViewController *cutVC = [[CutImageViewController alloc] initWithCutImage:image];
    [self pushVC:cutVC];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ------------------- 内部调用方法部分
- (void)showAlertView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"查看历史头像" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark ------------------- 懒加载部分
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CNScreenWidth, 44 * self.tableData.count) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSArray *)tableData
{
    if (!_tableData) {
        NSDictionary *dict1 = [NSDictionary dictionaryWithObjects:@[@"编辑头像", @""] forKeys:@[@"title", @"icon"]];
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:@[@"个人资料编辑", @"gaoyu"] forKeys:@[@"title", @"desc"]];
        NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:@[@"字体大小", @"16"] forKeys:@[@"title", @"desc"]];
        NSDictionary *dict4 = [NSDictionary dictionaryWithObjects:@[@"推送消息", @"默认(开)"] forKeys:@[@"title", @"desc"]];
        NSDictionary *dict5 = [NSDictionary dictionaryWithObjects:@[@"版本更新", @"1.0.1"] forKeys:@[@"title", @"desc"]];
        NSDictionary *dict6 = [NSDictionary dictionaryWithObjects:@[@"缓存清理", @"1024M"] forKeys:@[@"title", @"desc"]];
        _tableData = [NSArray arrayWithObjects:dict1, dict2, dict3, dict4, dict5, dict6, nil];
    }
    return _tableData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
