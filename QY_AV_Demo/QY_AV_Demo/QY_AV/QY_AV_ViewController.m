//
//  QY_AV_ViewController.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_AV_ViewController.h"

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface QY_AV_ViewController ()

@end

@implementation QY_AV_ViewController

+(instancetype)getShareInstance
{
    static QY_AV_ViewController *avVC = nil;
    if (!avVC) {
        avVC = [[QY_AV_ViewController alloc] init];
    }
    return avVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initShowPlayer];
}

- (QY_AV_PlayerView *)playerView
{
    if (!_playerView) {
//        _playerView = [[QY_AV_PlayerView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenWidth/2)];
        _playerView = [QY_AV_PlayerView getPlayerViewWithFromFrame:CGRectMake(0, 300, kScreenWidth, kScreenWidth/2)];
    }
    return _playerView;
}

- (void)initShowPlayer
{
    [self.playerView setUrlString:_dataModel.mp4_url];
    [self.view addSubview:_playerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
