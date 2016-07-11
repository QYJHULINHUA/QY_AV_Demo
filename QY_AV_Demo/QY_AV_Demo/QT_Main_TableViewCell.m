//
//  QT_Main_TableViewCell.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/5.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QT_Main_TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation QT_Main_TableViewCellModel

- (void)configPropertyWithDic:(NSDictionary*)dic
{
    _cover = dic[@"cover"];
    _descriptions = dic[@"description"];
    _m3u8_url = dic[@"m3u8_url"];
    _mp4_url = dic[@"mp4_url"];
    _ptime = dic[@"ptime"];
    _title = dic[@"title"];
    _topicDesc = dic[@"topicDesc"];
    _topicImg = dic[@"topicImg"];
    _topicName = dic[@"topicName"];
    _topicSid = dic[@"topicSid"];
    _replyCount = dic[@"replyCount"];
}


@end



@implementation QT_Main_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setInfoDic:(NSDictionary *)infoDic
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _model = [QT_Main_TableViewCellModel new];
        [_model configPropertyWithDic:infoDic];
        _infoDic = infoDic;
        dispatch_async(dispatch_get_main_queue(), ^{
            _title.text = _model.title;
            _time.text = [NSString stringWithFormat:@"%@",_model.ptime];
            [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.cover] placeholderImage:[UIImage imageNamed:@"bg_media_default"]];
        });
    });
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
