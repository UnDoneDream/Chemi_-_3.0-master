
//
//  BaseViewController.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()<UIScrollViewDelegate>

@property (strong,nonatomic) UIButton *leftBtn;
@property (strong,nonatomic) UIButton *rightBtn;

@property (strong,nonatomic) UIView *navBarView;

@property (strong,nonatomic) UIView *backs;

@end

@implementation BaseViewController
{
    UIScrollView *_trysScrolls;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

     self.navigationController.navigationBar.shadowImage = [UIImage new];
    
     [self setDefaultNavigationBar];
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
     self.navigationItem.title = self.titles;
     self.automaticallyAdjustsScrollViewInsets = NO;
    
//    if ([self.types isEqualToString:@"ones"] ) {
        
//          [self trysScrolls];
//
//    }else
//    {
//    
//        [self.trysScrolls removeFromSuperview];
//    }
    
    
}

#pragma mark ------------------ 拦截push方法 ----------------------
- (void)PushHideBottomBar:(BaseViewController *)controller
{
    //默认的返回按钮图片
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"detail_nav_back_28x28_"] forState:UIControlStateNormal];
//    button.size = CGSizeMake(30, 30);
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.contentEdgeInsets = CNDefaultEDG;
//    [button addTarget:self action:@selector(popBackLastController) forControlEvents:UIControlEventTouchUpInside];
//    controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    
//    self.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:controller animated:YES];
    
}

#pragma mark ---------------- 是否隐藏tabbar -------------------
- (void)pushController:(BaseViewController *)controller
{
//    //默认的返回按钮图片
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"detail_nav_back_28x28_"] forState:UIControlStateNormal];
//    button.size = CGSizeMake(30, 30);
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.contentEdgeInsets = CNDefaultEDG;
//    [button addTarget:self action:@selector(popBackLastController) forControlEvents:UIControlEventTouchUpInside];
//    controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:controller animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)hideBottomBarPush:(BaseViewController *)controller {
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark --------------------- Settiing Nav Style -----------------------------
- (void)setDefaultNavigationBar
{
    [self setNavigationBarBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]]
                                tintColor:[UIColor whiteColor]
                                textColor:CNDefaultColor
                           statusBarStyle:UIStatusBarStyleDefault];
}

- (void)setNavigationBarBackgroundImage:(UIImage *)image
                              tintColor:(UIColor *)tintColor
                              textColor:(UIColor *)textColor
                         statusBarStyle:(UIStatusBarStyle)style
{
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarTintColor:tintColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:textColor,NSFontAttributeName:SYSTEM_FONT(18)};
    [UIApplication sharedApplication].statusBarStyle = style;
    
}
- (void)setNavigationBarCover:(UIScrollView *)scrollView
                        color:(UIColor *)color
{
   
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alphas;
    if (offsetY > Zeros) {
        CGFloat alpha = MIN(1, 1 - ((MainNavH - offsetY) / MainNavH));
        alphas = alpha;
        self.navBarView.backgroundColor = CNDefault_OTHER_COLORs(alpha);
        if (offsetY >= MainNavH){
            if (self.titles) {
                self.navigationItem.titleView.hidden = NO;
                self.navigationItem.titleView = [self returnNavTitlesAndTitles:self.titles andColor:CNDefaultColor];
                
            }
        }
    } else {
        self.navigationItem.titleView.hidden = NO;
        self.navBarView.backgroundColor = CNDefault_OTHER_COLORs(Zeros);
    }
        self.navigationController.navigationBar.shadowImage = [UIImage new];

}

#pragma mark ----------------------- 设置titleView图片 --------------------
- (void)setTitleView:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, AllFifthH)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = IMAGE_NAMED(imageName);
    imageView.image = image;
    self.navigationItem.titleView = imageView;
}

#pragma mark ------------- 设置左边的title／title ＋ image ／image
- (void)setBackItem:(NSString *)title action:(SEL)sel
{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:sel];
    self.navigationItem.backBarButtonItem = backItem;
    
}
- (void)setLeftImageNamed:(NSString *)name action:(SEL)action
{
     UIImage *image = [UIImage imageNamed:name];
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.backgroundColor = [UIColor redColor];
    _leftBtn.frame = CGRectMake(Zeros, Zeros, image.size.width, AllFifthH);
    [_leftBtn setImage:image forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    _leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _leftBtn.contentEdgeInsets = CNUIEdgeB(-8);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    @weakify(self);
    [_leftBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        @strongify(self);
        if (!action) {
            [self popBackLastController];
        }
    }];
    
}
- (void)setLeftItemTitle:(NSString *)title andImageNamed:(NSString *)name andAction:(SEL)action
{
    
    UIImage *images = [UIImage imageNamed:name];
    NSDictionary *attributes = @{NSFontAttributeName: SYSTEM_FONT(15)};
    CGSize size = [title sizeWithAttributes:attributes];
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.backgroundColor = [UIColor orangeColor];
    _leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _leftBtn.contentEdgeInsets = CNUIEdgeB(-8);
    [_leftBtn.imageView setContentMode:UIViewContentModeLeft];
    [_leftBtn.titleLabel setContentMode:UIViewContentModeRight];
    [_leftBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [_leftBtn setImage:images forState:UIControlStateNormal];
    [_leftBtn setTitle:title forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = SYSTEM_FONT(15);
    _leftBtn.frame = CGRectMake(Zeros, Zeros,images.size.width+size.width+10, AllFifthH);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    @weakify(self);
    [_leftBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        @strongify(self);
        if (!action) {
            [self popBackLastController];
        }
    }];
    
}
- (void)setLeftItemTitle:(NSString *)title action:(SEL)action
{
    NSDictionary *attributes = @{NSFontAttributeName: SYSTEM_FONT(15)};
    CGSize size = [title sizeWithAttributes:attributes];
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.backgroundColor = [UIColor orangeColor];
    _leftBtn.frame = CGRectMake(Zeros, Zeros, size.width <= 10 ? 70 : size.width + 10, AllFifthH);
    _leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    _leftBtn.titleLabel.font = SYSTEM_FONT(15);
    [_leftBtn setTitleColor:CNDefaultColor forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_leftBtn setTitle:title forState:UIControlStateNormal];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    
    [_leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, backItem];
    
}
#pragma mark ----------------  左边按钮的返回 Method ----------------
- (void)popBackLastController {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --------------- 设置右边的控件 -----------------

- (void)setRightItemTitle:(NSString *)title action:(SEL)action {
    [self setRightItemTitle:title titleColor:CNDefaultColor action:action];
}
- (void)setRightItemTitle:(NSString *)title titleColor:(UIColor *)color action:(SEL)action
{
    NSDictionary *attributes = @{NSFontAttributeName: SYSTEM_FONT(15)};
    CGSize size = [title sizeWithAttributes:attributes];
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.backgroundColor = [UIColor clearColor];
    _rightBtn.frame = CGRectMake(Zeros, Zeros, size.width <= 10 ? 70 : size.width + 10, AllFifthH);
    [_rightBtn setTitleColor:color forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[color colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [_rightBtn setTitle:title forState:UIControlStateNormal];
    _rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    _rightBtn.titleLabel.font = SYSTEM_FONT(15);
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    [_rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
    
}

- (void)setRightImageNamed:(NSString *)name action:(SEL)action {
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.backgroundColor = [UIColor yellowColor];
    UIImage *image2=  [UIImage imageNamed:name];
    _rightBtn.frame =CGRectMake(Zeros, Zeros, NavBtnW, AllFifthH);
    _rightBtn.imageEdgeInsets = CNUIEdgeD(-10);
    [_rightBtn setImage:image2 forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
}

- (void)setupRightItems:(NSArray *)images {
    CGFloat margin = 0.0, width = AllFifthH;
    UIView *container = [UIView new];
    container.origin = CGPointMake(Zeros, Zeros);
    container.size = CGSizeMake(width*images.count+margin*(images.count-1), AllFifthH);
    for (int i=0; i<images.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.size = CGSizeMake(NavBtnW, width);
        CGFloat x = CGRectGetMaxX(container.frame)-(22+i*22);
        button.contentEdgeInsets = CNUIEdgeD(-4);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.origin = CGPointMake(x, Zeros);
        button.tag = i+1;
        [button setImage:IMAGE_NAMED(images[i]) forState:UIControlStateNormal];
        [container addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:container];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)click:(UIButton *)sender
{

  
    CNLog(@"%zd",sender.tag);
}

#pragma mark --------------------  UIScrollView Delegate Method -----------------------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.titles) {
        self.navigationItem.title = @"";
    }
    
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alphas;
    if (offsetY > Zeros) {
        CGFloat alpha = MIN(1, 1 - ((MainNavH - offsetY) / MainNavH));
        alphas = alpha;
        self.navBarView.backgroundColor = CNDefault_OTHER_COLORs(alpha);
        if (offsetY >= MainNavH){
            if (self.titles) {
        self.navigationItem.titleView.hidden = NO;
        self.navigationItem.titleView = [self returnNavTitlesAndTitles:self.titles andColor:CNDefaultColor];
                
            }
        }
    } else {
        self.navigationItem.titleView.hidden = YES;
        self.navigationItem.title = @"";
        self.navBarView.backgroundColor = CNDefault_OTHER_COLORs(alphas);
    }
}

#pragma mark -------------------- lazy load ----------------------------
- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.frame = CGRectMake(Zeros, Zeros, [UIScreen mainScreen].bounds.size.width, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}
- (UIScrollView *)trysScrolls
{
    if(!_trysScrolls)
    {
        _trysScrolls = [[UIScrollView alloc]initWithFrame:CGRectMake(Zeros, Zeros, CNScreenWidth, CNScreenHeight)];
        _trysScrolls.backgroundColor = CNColor(241, 241, 241);
        _trysScrolls.showsVerticalScrollIndicator = NO;
        _trysScrolls.delegate = self;
        _trysScrolls.contentSize = CGSizeMake(Zeros, CNScreenHeight *2);
//        [self.view addSubview:_trysScrolls];
        
    }
    
    return _trysScrolls;
    
}
@end
