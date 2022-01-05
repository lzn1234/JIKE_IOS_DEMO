//
//  LZListLoader.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/9/15.
//

#import "LZListLoader.h"
#import "AFNetworking.h"
#import "LZListModel.h"

@interface LZListLoader ()

@end

@implementation LZListLoader

- (void)loadListData:(LZListLoaderFinishBlock)finishBlock {
    
    // 填充本地数据
    NSArray<LZListModel *> *localDataArray = [self _readDataFromLocal];
    if (localDataArray != nil && finishBlock != nil) {
        finishBlock(true, localDataArray);
    }
    
//  使用 AFNetworking 进行网络请求
    AFHTTPSessionManager *maganer = [[AFHTTPSessionManager alloc]init];
    __weak typeof(self) wSelf = self;
    [maganer GET:@"http://v.juhe.cn/toutiao/index?type=top&key=5364cddd60939810860f8c1e4b763db5" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong typeof(self) strongSelf = wSelf;
        NSArray *dataArray = responseObject[@"result"][@"data"];
        NSMutableArray<LZListModel *> *newsArray = [NSMutableArray array];

        for (NSDictionary *data in dataArray) {
            [newsArray addObject:[LZListModel mj_objectWithKeyValues:data]];
        }

        // 存储数据到本地
        [strongSelf _archiveNewsListDataWithArray:[newsArray copy]];

        // 请求结束后在主线程传回列表数组
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(true, [newsArray copy]);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark -< Archive Data Method >

// 读取本地数据
- (NSArray<LZListModel *> *)_readDataFromLocal {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"LZData/newsListData"];

    // 读档 + 反序列化
    NSData *readListData = [fileManager contentsAtPath:filePath];
    id unarchivedData = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [LZListModel class], [NSString class], nil] fromData:readListData error:nil];
    
    
    if ([unarchivedData isKindOfClass:[NSArray class]] && [unarchivedData count] > 0) {
        return (NSArray<LZListModel *> *)unarchivedData;
    }
    return nil;
}

// 存档新闻列表
- (void)_archiveNewsListDataWithArray:(NSArray<LZListModel *> *)dataArray {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // cache文件夹路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    // 数据存储 文件夹 及 文件 路径
    NSString *directoryPath = [cachePath stringByAppendingPathComponent:@"LZData"];
    NSString *filePath = [directoryPath stringByAppendingPathComponent:@"newsListData"];
    
    // 创建文件夹
    if (![fileManager fileExistsAtPath:directoryPath]) {
        NSError *createError;
        [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&createError];
    }
    
    // 序列化 + 存档
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:dataArray requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:filePath contents:archivedData attributes:nil];
}

@end
