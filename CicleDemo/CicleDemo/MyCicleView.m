//
//  MyCicleView.m
//  CicleDemo
//
//  Created by liyongfei on 2018/3/14.
//  Copyright © 2018年 liyongfei. All rights reserved.
//

#import "MyCicleView.h"
#import "UIView+Frame.h"
@implementation MyCicleView
#define kSmallGreen [UIColor colorWithRed:21/255.0 green:181/255.0 blue:57/255.0 alpha:1.0]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = _titleStr;
    
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.x = 20;
    titleLabel.y = 10;
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    if (_isMore) {
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        moreBtn.backgroundColor = [UIColor redColor];
        [moreBtn setTitleColor:kSmallGreen forState:UIControlStateNormal];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
//        [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
//        [moreBtn sizeToFit];
        moreBtn.height = 30;
        moreBtn.width = 100;
        moreBtn.centerY = titleLabel.centerY;
        moreBtn.x = self.width - moreBtn.width;
        [self addSubview:moreBtn];
    }
}
@end
