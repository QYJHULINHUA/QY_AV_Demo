//
//  QY_Main_HeaderView.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_Main_HeaderView.h"


@implementation QY_Main_HeaderView

- (void)setTipsArray:(NSArray *)array
{
    self.backgroundColor = [UIColor whiteColor];
    NSUInteger count = array.count;
    CGFloat w_w = self.frame.size.width / count;
    CGFloat h_h = self.frame.size.height;
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i = 0 ; i < count; i ++) {
            CGFloat origin_x = i * w_w;
            QY_Main_ButtonView *buttonView = [[QY_Main_ButtonView alloc] initWithFrame:CGRectMake(origin_x, 0, w_w, h_h)];
            buttonView.infoDic = array[i];
            [self addSubview:buttonView];
        }
    });
  
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
