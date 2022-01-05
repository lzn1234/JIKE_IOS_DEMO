//
//  LZRecommendController.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/13.
//

#import "LZRecommendController.h"
#import "AFNetworking.h"

@interface LZRecommendController ()<UIScrollViewDelegate>

@end

@implementation LZRecommendController

- (instancetype)init {
    self = [super self];
    if(self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"page"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:@"http://baobab.kaiyanapp.com/api/v4/discovery/hot?start=1&num=1" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @"";
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
