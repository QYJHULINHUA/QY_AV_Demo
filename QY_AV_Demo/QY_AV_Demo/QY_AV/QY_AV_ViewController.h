//
//  QY_AV_ViewController.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QT_Main_TableViewCell.h"
#import "QY_AV_PlayerView.h"

@interface QY_AV_ViewController : UIViewController

@property (nonatomic ,strong)QT_Main_TableViewCellModel *dataModel;
@property (nonatomic ,strong)QY_AV_PlayerView *playerView;

+(instancetype)getShareInstance;



@end
