//
//  QY_MainViewController.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_MainViewController.h"
#import "QT_Main_TableViewCell.h"
#import "QY_AV_Net.h"
#import "QY_AV_ViewController.h"

#define homeURL @"http://c.m.163.com/nc/video/home/0-10.html"
#define moreURL @"http://c.m.163.com/nc/video/home/%ld-10.html"
#define listURL @"http://c.3g.163.com/nc/video/list/%@/y/0-10.html"
#define listMoreURL @"http://c.3g.163.com/nc/video/list/%@/y/%ld-10.html"

@interface QY_MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __block NSMutableArray *dataArray;
    __block NSArray *sidArray;
}

@end

@implementation QY_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.title = @"集合";
    _mainTableView.rowHeight = 240.f;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)loadData
{
    [QY_AV_Net reqSomeStingWithUrlstr:homeURL response:^(BOOL isSuccess, id data) {
        if (isSuccess) {
            sidArray = data[0];
            [_mainHeaderView setTipsArray:sidArray];
            
            dataArray = [NSMutableArray arrayWithArray:data[1]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_mainTableView reloadData];
            });
            
        }else
        {
            
        }
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QT_Main_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainTableCellID"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QT_Main_TableViewCell" owner:nil options:nil] firstObject];
    }
    cell.infoDic = dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QT_Main_TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    QT_Main_TableViewCellModel *cellData = cell.model;
    [self pushToAVPlayViewController:cellData];
}

- (void)pushToAVPlayViewController:(QT_Main_TableViewCellModel*)cellData
{
    QY_AV_ViewController *avController = [QY_AV_ViewController getShareInstance];
    avController.dataModel = cellData;
    [self.navigationController pushViewController:avController animated:YES];
    
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
