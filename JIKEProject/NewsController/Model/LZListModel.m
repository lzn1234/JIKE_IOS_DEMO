//
//  LZListModel.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/17.
//

#import "LZListModel.h"


@implementation LZListModel

// 更新属性名和字典的映射
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
        @"authorName" : @"author_name",
        @"thumbnailPicS1" : @"thumbnail_pic_s",
        @"thumbnailPicS2" : @"thumbnail_pic_s02",
        @"thumbnailPicS3" : @"thumbnail_pic_s03",
    };
}

@end
