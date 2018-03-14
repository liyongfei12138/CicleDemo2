//
//  MyCicleController.m
//  CicleDemo
//
//  Created by liyongfei on 2018/3/14.
//  Copyright © 2018年 liyongfei. All rights reserved.
//

#import "MyCicleController.h"
#import "UIView+Frame.h"
#import "MyCicleCollectionCell.h"
#import "MyCicleView.h"
@interface MyCicleController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *headerDataArr;
}
@property (nonatomic,strong) UICollectionView *collectionView;

@end
//#define headerId @"headerIdentifier"
//#define footerId @"footerIdentifier"
@implementation MyCicleController
static NSString *headerId = @"headerIdentifier";
static NSString *footerId = @"footerIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor ];
    // 初始化界面
    [self initView];
    // 初始化数据
    [self initValue];
}
// 初始化数据
- (void)initValue
{
    headerDataArr = [NSArray arrayWithObjects:@"我的创建", @"我的关注", @"热门推荐", nil];
}
// 初始化界面
- (void)initView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [layout setSectionInset:UIEdgeInsetsMake(0, 5, 0, 5)];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.collectionHeight) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

     // 复用footview
//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.collectionView registerClass:[MyCicleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@%d",headerId,0]];
    [self.collectionView registerClass:[MyCicleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@%d",headerId,1]];
    [self.collectionView registerClass:[MyCicleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@%d",headerId,2]];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    [self.view addSubview:self.collectionView];
    
   
}
#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.width * 0.25 - 5 , self.view.width * 0.25 + 30);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  
    return headerDataArr.count;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else{
        return 5;
    }
    
}
// RGB颜色
#define CBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"myCicleCell";
    
    UINib *nib = [UINib nibWithNibName:@"MyCicleCollectionCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    
    MyCicleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.cicleiImgView.image = [UIImage ];
    cell.titleLabel.text = [NSString stringWithFormat:@"中国足球%ld",indexPath.section];
//    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
#define kSmallGray [UIColor colorWithRed:241.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0f]
// 设置FootView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyCicleView *reusableView = nil;
//    [reusableView removeFromSuperview];
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        MyCicleView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@%ld",headerId,indexPath.section] forIndexPath:indexPath];
//        NSLog(@"%@",headerDataArr[indexPath.section]);
        NSLog(@"%ld",indexPath.section);
        
        headerView.titleStr = headerDataArr[indexPath.section];
        if (indexPath.section != 0) {
            headerView.isMore = YES;
        }
        
        reusableView = headerView;
        
        
        
    }
    if (kind == UICollectionElementKindSectionFooter)
    {
        MyCicleView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId forIndexPath:indexPath];

        footerView.backgroundColor = kSmallGray;
        
        reusableView = footerView;
        
    }
    return reusableView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.width, 50);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.view.width, 10);
}

@end
