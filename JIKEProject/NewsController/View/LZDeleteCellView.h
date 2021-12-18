//
//  LZDeleteCellView.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 点击删除弹窗
 */
@interface LZDeleteCellView : UIView

/**
 @param point 点击位置
 @param closeBlock 点击删除后操作
 */
- (void)showDeleteViewFromPint:(CGPoint)point closeBlock:(dispatch_block_t)closeBlock;

@end

NS_ASSUME_NONNULL_END
