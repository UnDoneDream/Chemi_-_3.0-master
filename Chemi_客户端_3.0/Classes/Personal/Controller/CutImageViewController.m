//
//  CutImageViewController.m
//  Chemi_客户端_3.0
//
//  Created by 高宇 on 17/2/6.
//  Copyright © 2017年 ju. All rights reserved.
//

#import "CutImageViewController.h"
#import "CutView.h"
@interface CutImageViewController ()
{
    CGFloat imageScale;         //图片宽高比
    CGPoint startPoint, endPoint;         //开始拖拽点
    CGSize endSize;
}

@property (strong, nonatomic) UIImage *cutImage;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (weak, nonatomic) UIImageView *needCutImageView;
@property (weak, nonatomic) UIImageView *cutedImageView;

@end

@implementation CutImageViewController

- (NSString *)titles
{
    return @"截取合适的图片";
}

- (instancetype) initWithCutImage:(UIImage *)image
{
    if (self = [super init]) {
        self.cutImage = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    imageScale = self.cutImage.size.width / self.cutImage.size.height;
    [self setRightItemTitle:@"保存" titleColor:[UIColor whiteColor] action:@selector(saveImage)];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *needCutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageScale * 200, imageScale * 200)];
    needCutImageView.center = self.view.center;
    needCutImageView.image = self.cutImage;
    self.needCutImageView = needCutImageView;
    [self.view addSubview:needCutImageView];
    
    CutView *cutView = [[CutView alloc] initWithFrame:CNScreenBounds];
    cutView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cutView];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    panRecognizer.minimumNumberOfTouches = 1;
    panRecognizer.maximumNumberOfTouches = 1;
    [cutView addGestureRecognizer:panRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [cutView addGestureRecognizer:pinchRecognizer];
    
}

#pragma mark  ----------------------------------------事件处理部分
- (void)saveImage
{
    CNLog(@"保存图片");
}

//拖拽手势
- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    CNLog(@"panRecognizer = %ld",(long)recognizer.state);
//    if ((self.needCutImageView.x <= self.view.center.x - 50
//        && self.needCutImageView.x >= (self.view.center.x + 50) - self.needCutImageView.width)
//        && (self.needCutImageView.y <= self.view.center.y - 50
//            && self.needCutImageView.y >= (self.view.center.y + 50) - self.needCutImageView.height)) {
        if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
            CGPoint translation = [recognizer translationInView:recognizer.view.superview];
            CNLog(@"%@",NSStringFromCGPoint(translation));
            if(recognizer.state == UIGestureRecognizerStateBegan){
                startPoint = translation;
                if (endPoint.x == 0 && endPoint.y == 0) {
                    endPoint = self.view.center;
                }
            }else{
                self.needCutImageView.center = CGPointMake(endPoint.x + (translation.x - startPoint.x), endPoint.y + (translation.y - startPoint.y));
            }
        }else if(recognizer.state == UIGestureRecognizerStateEnded){
            endPoint = self.needCutImageView.center;
        }
//    }else{
//        
//    }
}
//捏合手势
- (void)pinch:(UIPinchGestureRecognizer *)recognizer
{
    CNLog(@"pinchRecognizer = %f", recognizer.scale);
    
    if (self.needCutImageView.size.width >= 100 && self.needCutImageView.size.height >= 100) {
        if (recognizer.state == UIGestureRecognizerStateChanged){
            self.needCutImageView.size = CGSizeMake(endSize.width * recognizer.scale, endSize.height * recognizer.scale);
        }else{
            endSize = self.needCutImageView.size;
        }
    }
}

#pragma mark  ----------------------------------------懒加载部分
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        _scrollView.center = self.view.center;
        _scrollView.layer.cornerRadius = 75.0;
        _scrollView.scrollEnabled = YES;
    }
    return _scrollView;
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
