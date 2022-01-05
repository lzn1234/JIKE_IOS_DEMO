//
//  LZVedioCollectionViewCell.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/25.
//

#import "LZVedioCollectionViewCell.h"
#import "LZVideoPlayer.h"

@interface LZVedioCollectionViewCell ()

@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong, readwrite) UIImageView *coverImgaeVIew;
@property (nonatomic, strong, readwrite) UIImageView *playImageView;

@end

@implementation LZVedioCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initView];
    }
    return self;
}

#pragma mark -< init subViews >

- (void)_initView {
    self.coverImgaeVIew = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        imageView.image = [UIImage imageNamed:@"videoCover"];
        imageView;
    });
    [self.contentView addSubview:self.coverImgaeVIew];
    
    self.playImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"videoPlay"];
        imageView;
    });
    [self.contentView addSubview:self.playImageView];
    [self.playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToVedio)]];
    
}

#pragma mark -< private mtehod >

// 点击播放
- (void)_tapToVedio {
    [[LZVideoPlayer Player] playWithVideoUrl:self.videoUrl attchView:self.contentView];    
}

#pragma mark - < public method >

- (void)layoutWithVideoCoverUrl:(NSString *)coverUrl videoUrl:(NSString *)videoUrl {
    self.videoUrl = videoUrl;
}

@end
