//
//  LZListModel.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/17.
//

#import "LZListModel.h"


@implementation LZListModel

#pragma mark -< NSSecureCoding Delegate >

// 反序列化
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.authorName = [coder decodeObjectForKey:@"authorName"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.thumbnailPicS1 = [coder decodeObjectForKey:@"thumbnailPicS1"];
        self.thumbnailPicS2 = [coder decodeObjectForKey:@"thumbnailPicS2"];
        self.thumbnailPicS3 = [coder decodeObjectForKey:@"thumbnailPicS3"];
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.url = [coder decodeObjectForKey:@"url"];
    }
    return self;
}

// 序列化
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.thumbnailPicS1 forKey:@"thumbnailPicS1"];
    [coder encodeObject:self.thumbnailPicS2 forKey:@"thumbnailPicS2"];
    [coder encodeObject:self.thumbnailPicS3 forKey:@"thumbnailPicS3"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.url forKey:@"url"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark -< MJExtension Method >

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
