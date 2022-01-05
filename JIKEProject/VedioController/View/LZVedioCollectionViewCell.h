//
//  LZVedioCollectionViewCell.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZVedioCollectionViewCell : UICollectionViewCell

- (void)layoutWithVideoCoverUrl:(NSString *)coverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
