//
//  MyCicleCollectionCell.m
//  CicleDemo
//
//  Created by liyongfei on 2018/3/14.
//  Copyright © 2018年 liyongfei. All rights reserved.
//

#import "MyCicleCollectionCell.h"
#import "UIView+Frame.h"
#define kSmallGray [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0f]
@implementation MyCicleCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)drawRect:(CGRect)rect
{
    _cicleiImgView.layer.cornerRadius = _cicleiImgView.width * 0.5;
    _cicleiImgView.clipsToBounds = YES;
    _cicleiImgView.layer.borderWidth = 1;
    _cicleiImgView.layer.borderColor = kSmallGray.CGColor;
//    _cicleiImgView.layer.a
}
@end
