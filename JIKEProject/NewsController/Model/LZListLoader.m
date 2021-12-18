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
    // 使用 AFNetworking 进行网络请求
    AFHTTPSessionManager *maganer = [[AFHTTPSessionManager alloc]init];
    [maganer GET:@"http://v.juhe.cn/toutiao/index?type=top&key=5364cddd60939810860f8c1e4b763db5" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *dataArray = responseObject[@"result"][@"data"];
        NSMutableArray *newsArray = [NSMutableArray array];
        
        for (NSDictionary *data in dataArray) {
            [newsArray addObject:[LZListModel mj_objectWithKeyValues:data]];
        }
        // 请求结束后在主线程传回列表数组
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(true, [newsArray copy]);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
//    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=5364cddd60939810860f8c1e4b763db5";
//    NSURL *url = [NSURL URLWithString:urlString];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    NSURLSessionTask *sessionTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        NSMutableArray *newsArray = [NSMutableArray array];
//        NSDictionary *dataDic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSArray *dataArray = dataDic[@"result"][@"data"];
//
//        for (NSDictionary *data in dataArray) {
//            [newsArray addObject:[LZListModel mj_objectWithKeyValues:data]];
//        }
//        // 必须在主线程调用, 请求结束后传回列表数组
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (finishBlock) {
//                finishBlock(true, [newsArray copy]);
//            }
//        });
//    }];
//    [sessionTask resume];
}


@end
