//
//  CicleHomeController.m
//  CicleDemo
//
//  Created by liyongfei on 2018/3/12.
//  Copyright © 2018年 liyongfei. All rights reserved.
//

#import "CicleHomeController.h"
#import "UIImage+Image.h"
#import <TYTabPagerView.h>
#import "MyCicleController.h"
#import "UIView+Frame.h"
@interface CicleHomeController ()<TYTabPagerViewDelegate,TYTabPagerViewDataSource>
{
    NSArray *dataArr;
    UIView *shadowView;
    TYTabPagerView *pageView;
}
@end

@implementation CicleHomeController
#define kSmallGray [UIColor colorWithRed:241.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0f]
// RGB颜色
#define CBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define RandomColor CBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define kSmallGreen [UIColor colorWithRed:21/255.0 green:181/255.0 blue:57/255.0 alpha:1.0]
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    // 按钮样式
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
//    [leftBtn sizeToFit];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    leftBtn.layer.cornerRadius = 22;
    leftBtn.clipsToBounds = YES;
    
//    [self.view addSubview:leftBtn];

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    rightBtn.layer.cornerRadius = 22;
    rightBtn.clipsToBounds = YES;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView: rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView: leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.title = @"圈子";
    
//        navigationBar 样式
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initValue];
    [self initShadowView];
    [self initPageView];
    
    [pageView reloadData];
}
- (void)initValue
{
    dataArr = [NSArray arrayWithObjects:@"我的圈子", @"我的话题", @"我的回复", nil];
}

- (void)initShadowView
{
    shadowView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.navigationController.view.frame.size.width, 5)];
    shadowView.backgroundColor = kSmallGray;
    
    [self.view addSubview:shadowView];
}
- (void)initPageView
{
//    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, shadowView.frame.size.height, shadowView.frame.size.width, 50)];
//
//    tabBarView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:tabBarView];
//
    
    
    
    pageView = [[TYTabPagerView alloc] init];
//    pageView.tabBarHeight = 0;
    pageView.frame = CGRectMake(0, shadowView.frame.size.height, shadowView.frame.size.width, self.view.frame.size.height - shadowView.frame.size.height + shadowView.frame.size.height);
//    pageView.tabBar.backgroundColor
    pageView.tabBar.layout.barStyle = TYPagerBarStyleProgressView;
    pageView.tabBar.layout.adjustContentCellsCenter = YES;
    pageView.tabBar.layout.cellWidth = self.view.frame.size.width * 0.33;
    pageView.tabBar.progressView.backgroundColor = [UIColor clearColor];
    
    
    pageView.delegate = self;
    pageView.dataSource = self;
    [self.view addSubview:pageView];
}
#pragma mark - TYPagerViewDelegate
- (NSInteger)numberOfViewsInTabPagerView
{
    return dataArr.count;
}
- (UIView *)tabPagerView:(TYTabPagerView *)tabPagerView viewForIndex:(NSInteger)index prefetching:(BOOL)prefetching
{
    UIView *view = [[UIView alloc]initWithFrame:[tabPagerView.layout frameForItemAtIndex:index]];
    view.backgroundColor = RandomColor;
    
    MyCicleController *myCicle = [[MyCicleController alloc] initWithStyle:UITableViewStyleGrouped];
    myCicle.view.y = 0;
    myCicle.view.height = view.height;
    
    [self addChildViewController:myCicle];
    [view addSubview:myCicle.view];
    
    return view;
}
- (NSString *)tabPagerView:(TYTabPagerView *)tabPagerView titleForIndex:(NSInteger)index
{
    return dataArr[index];
}

@end
