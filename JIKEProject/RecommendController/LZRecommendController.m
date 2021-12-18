//
//  LZRecommendController.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/13.
//

#import "LZRecommendController.h"

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

    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    NSArray *colorArr = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor],[UIColor greenColor],[UIColor grayColor]];
    
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i * (scrollView.frame.size.width), 0, scrollView.frame.size.width, scrollView.frame.size.height)];
            view.backgroundColor = colorArr[i];
            view;
        })];
    }
    
    [self.view addSubview:scrollView];
}

@end
