//
//  ViewController.m
//  1-SetNavigationBarAlpha
//
//  Created by 奉强 on 16/2/25.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extention.h"
#import "UIColor+Extention.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setScrollView];
    
    [self setNavigation];
}

- (void)setNavigation {
    //设置导航栏背景颜色
    UIImage *navigationBarBackgroundImage = [UIImage imageFromColor:[UIColor redColor] imageSize:CGSizeMake(WIDTH, 64)];
    navigationBarBackgroundImage = [UIImage imageByApplyingAlpha:0 image:navigationBarBackgroundImage];
    [self.navigationController.navigationBar setBackgroundImage:navigationBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setScrollView {
    //设置滚动视图
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [UIImage imageNamed:@"111.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, (image.size.width/WIDTH)*HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(0, imageView.bounds.size.height);
    self.scrollView.delegate = self;
    imageView.image = image;
    
    [self.scrollView addSubview:imageView];
    
    
    [self.view addSubview:self.scrollView];
}

#pragma mark scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //设置导航栏背景透明度
    CGFloat alpha = (scrollView.contentOffset.y / 200.0f);
    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha;
    
    UIImage *navigationBarBackgroundImage = [UIImage imageFromColor:[UIColor redColor] imageSize:CGSizeMake(WIDTH, 64)];
    navigationBarBackgroundImage = [UIImage imageByApplyingAlpha:alpha image:navigationBarBackgroundImage];
    [self.navigationController.navigationBar setBackgroundImage:navigationBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
}



@end
