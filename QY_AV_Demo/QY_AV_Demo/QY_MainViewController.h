//
//  QY_MainViewController.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QY_Main_HeaderView.h"

@interface QY_MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet QY_Main_HeaderView *mainHeaderView;

@end
