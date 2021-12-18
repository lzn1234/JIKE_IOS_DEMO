//
//  LZListModel.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/17.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

NS_ASSUME_NONNULL_BEGIN
/**
 新闻列表数据模型
 */
@interface LZListModel : NSObject

@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *category;
@property (nonatomic, copy, readwrite) NSString *authorName;
@property (nonatomic, copy, readwrite) NSString *date;
@property (nonatomic, copy, readwrite) NSString *thumbnailPicS1;
@property (nonatomic, copy, readwrite) NSString *thumbnailPicS2;
@property (nonatomic, copy, readwrite) NSString *thumbnailPicS3;
@property (nonatomic, copy, readwrite) NSString *uniquekey;
@property (nonatomic, copy, readwrite) NSString *url;

@end

NS_ASSUME_NONNULL_END
