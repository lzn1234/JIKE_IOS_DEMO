//
//  LZListLoader.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/9/15.
//

#import <Foundation/Foundation.h>

@class LZListModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^LZListLoaderFinishBlock)(BOOL success, NSArray<LZListModel *>* dataArray);

/**
列表数据请求
 */
@interface LZListLoader : NSObject

- (void)loadListData:(LZListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
