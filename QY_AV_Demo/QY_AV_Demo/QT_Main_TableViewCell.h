//
//  QT_Main_TableViewCell.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  QT_Main_TableViewCellModel: NSObject
@property (nonatomic , copy)NSString *cover;
@property (nonatomic , copy)NSString *descriptions;
@property (nonatomic , copy)NSString *m3u8_url;
@property (nonatomic , copy)NSString *mp4_url;
@property (nonatomic , copy)NSString *ptime;
@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *topicDesc;
@property (nonatomic , copy)NSString *topicImg;
@property (nonatomic , copy)NSString *topicName;
@property (nonatomic , copy)NSString *topicSid;
@property (nonatomic , copy)NSString *replyCount;



@end

@interface QT_Main_TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (nonatomic , strong)NSDictionary *infoDic;

@property (nonatomic , strong)QT_Main_TableViewCellModel *model;


@end
