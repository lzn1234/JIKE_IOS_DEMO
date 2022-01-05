//
//  LZVideoPlayer.m
//  JIKEProject
//
//  Created by 林振楠 on 2022/1/1.
//

#import "LZVideoPlayer.h"
#import "AVFoundation/AVFoundation.h"

@interface LZVideoPlayer ()

@property (nonatomic, strong,readwrite) AVAsset *avAsset;
@property (nonatomic, strong,readwrite) AVPlayerItem *avPlayerItem;
@property (nonatomic, strong,readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong,readwrite) AVPlayerLayer *avPlayerLayer;

@end

@implementation LZVideoPlayer

+ (LZVideoPlayer *)Player {
    static LZVideoPlayer *player;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        player = [LZVideoPlayer new];
    });
    return player;
}

#pragma mark -< private method >

// 播放结束操作
- (void)_handToEnd {
    [self.avPlayer seekToTime:CMTimeMake(0, 1)];
}

- (void)_stopPlay {
    
    // 移除监听
    [self.avPlayerItem removeObserver:self forKeyPath:@"status"];
    [self.avPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // 销毁播放器
    [self.avPlayerLayer removeFromSuperlayer];
    self.avPlayer = nil;
    self.avPlayerItem = nil;
}

#pragma mark -< public method >

- (void)playWithVideoUrl:(NSString *)videoUrl attchView:(UIView *)attchView {
    
    [self _stopPlay];
    
    self.avAsset = [AVAsset assetWithURL:[NSURL URLWithString:videoUrl]];
    
    self.avPlayerItem = [AVPlayerItem playerItemWithAsset:self.avAsset];
    [self.avPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.avPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    // 注册视频播放结束通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

    self.avPlayer = [AVPlayer playerWithPlayerItem:self.avPlayerItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度：%f", CMTimeGetSeconds(time));
    }];
    
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.avPlayerLayer.frame = attchView.bounds;
    [attchView.layer addSublayer:self.avPlayerLayer];
    
    [self.avPlayer play];
}

#pragma mark -< KVO method >

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)change[@"new"]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [self.avPlayer play];
        } else {
            NSLog(@"lll");
        }
    } else if([keyPath isEqualToString:@"loadedTimeRanges"]) {
        // 监听缓冲进度
        NSLog(@"缓冲进度：%@",change[@"new"]);
    }
}

@end
