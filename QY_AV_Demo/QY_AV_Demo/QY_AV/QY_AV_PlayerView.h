//
//  QY_AV_PlayerView.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface QY_AV_PlayerView : UIView

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic ,strong)AVPlayer *player;
@property (nonatomic ,strong)AVPlayerLayer *playerLayer;

+ (instancetype)getPlayerViewWithFromFrame:(CGRect)frame;
@property (weak, nonatomic) IBOutlet UIImageView *blackImgView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIButton *isPlay;
@property (weak, nonatomic) IBOutlet UIButton *isFullScreen;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UISlider *progressView;

@end
