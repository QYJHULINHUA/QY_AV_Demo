//
//  QY_Main_ButtonView.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_Main_ButtonView.h"
#import "UIButton+WebCache.h"

@implementation QY_Main_ButtonView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        btn.center =  CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height);
        [self addSubview:btn];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.center =  CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height + 30);
        [self addSubview:titleLabel];
    }
    return self;
}

- (void)setInfoDic:(NSDictionary *)infoDic
{
    _infoDic = infoDic;
    _imgsrc = infoDic[@"imgsrc"];
    [btn sd_setImageWithURL:[NSURL URLWithString:_imgsrc] forState:normal placeholderImage:nil];
    _sid = infoDic[@"sid"];
    _title = infoDic[@"title"];
    titleLabel.text = _title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
