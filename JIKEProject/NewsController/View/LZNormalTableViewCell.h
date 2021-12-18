//
//  LZNormalTableViewCell.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/13.
//

#import <UIKit/UIKit.h>

@class LZListModel;

NS_ASSUME_NONNULL_BEGIN

/**
 点击删除按钮操作协议
 */
@protocol LZNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell*)tableViewCell deleteBtn:(UIButton *)deleteBtn;

@end

/**
 新闻 TableView 上的新闻 cell
 */
@interface LZNormalTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<LZNormalTableViewCellDelegate> delegate;

/**
 @param model 新闻类型的 model
 */
- (void)layoutTableViewCellByModel:(LZListModel *)model;

@end

NS_ASSUME_NONNULL_END
