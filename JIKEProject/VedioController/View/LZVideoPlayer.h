//
//  LZVideoPlayer.h
//  JIKEProject
//
//  Created by 林振楠 on 2022/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZVideoPlayer : NSObject

+ (LZVideoPlayer *)Player;

/**
 @param videoUrl 视频对应的url
 @param attchView 该视频 View 要覆盖的图层
 */
- (void)playWithVideoUrl:(NSString *)videoUrl attchView:(UIView *)attchView;

/*
 禁止调用 init 初始化方法
 */
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
