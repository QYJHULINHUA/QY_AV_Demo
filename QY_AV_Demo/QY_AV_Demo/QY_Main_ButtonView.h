//
//  QY_Main_ButtonView.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QY_Main_ButtonView : UIView
{
    UIButton *btn;
    UILabel *titleLabel;
}

@property (nonatomic ,copy)NSString *imgsrc;
@property (nonatomic ,copy)NSString *sid;
@property (nonatomic ,copy)NSString *title;

@property (nonatomic ,strong)NSDictionary *infoDic;

@end
