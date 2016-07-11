//
//  QY_AV_PlayerView.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_AV_PlayerView.h"

@interface QY_AV_PlayerView ()
{
}


@end

@implementation QY_AV_PlayerView

+ (instancetype)getPlayerViewWithFromFrame:(CGRect)frame
{
    QY_AV_PlayerView *instace = [[[NSBundle mainBundle] loadNibNamed:@"QY_AV_PlayerView" owner:nil options:nil] firstObject];
    instace.frame = frame;
    [instace initPlayerLayer:instace.bounds];
    return instace;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPlayerLayer:self.bounds];
    }
    return self;
}

- (void)initPlayerLayer:(CGRect)frame
{
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    _playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;
    _playerLayer.frame = frame;
    [self.blackImgView.layer addSublayer:_playerLayer];
}

-(AVPlayer *)player
{
    if (!_player) {
        _player = [[AVPlayer alloc] init];
    }
    return _player;
}



-(void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    NSURL *url = [NSURL URLWithString:urlString];
    if (_player.currentItem) {
        [_player.currentItem removeObserver:self forKeyPath:@"status"];
    }
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    [_player replaceCurrentItemWithPlayerItem:item];
    [_player.currentItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_player play];
    
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        if (AVPlayerItemStatusReadyToPlay == status) {
            NSLog(@"OK");
        } else if(AVPlayerItemStatusFailed == status){
            NSLog(@"Failed");
        }else
        {
            NSLog(@"unknow");
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showWithAlpha:1];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//    
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [UIView animateWithDuration:0.3 animations:^{
//                [self showWithAlpha:0];
//            }];
//        });
//        
//        
//    });
    
    
    
    
    
}

- (void)showWithAlpha:(CGFloat)alpha
{
    _toolView.alpha = alpha;
    _isPlay.alpha = alpha;
    _isFullScreen.alpha = alpha;
    _time.alpha = alpha;
    _progressView.alpha = alpha;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
