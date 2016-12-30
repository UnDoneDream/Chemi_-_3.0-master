//
//  ReputationValueCell.h
//  Chemi_客户端_3.0
//
//  Created by 爱爱远人村 on 16/12/30.
//  Copyright © 2016年 ju. All rights reserved.
//

#warning message 我想有个动画，就是类似于小宠物之类的，放在信誉值上，跳动跳动的，围绕这这个信誉值转（1.0版本就不能点击，目前就暂时不能点击这个小宠物进行更换，如果以后更好的方法，可以进行点击，然后用户可以自己点击进行更换宠物）
#import <UIKit/UIKit.h>

@interface ReputationValueCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

+ (instancetype)returnOneCreatSuccessCell:(UITableView *)tableView;

@end
