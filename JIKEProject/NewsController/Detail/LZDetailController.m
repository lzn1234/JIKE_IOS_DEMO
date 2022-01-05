//
//  LZdetailController.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/14.
//

#import "LZDetailController.h"
#import <WebKit/WebKit.h>

@interface LZDetailController ()<WKNavigationDelegate>

@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *urlString;

@end

@implementation LZDetailController

- (instancetype)initWithURlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.urlString = urlString;
    }
    return self;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor whiteColor];
    
    self.webView = ({
        WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        webView.navigationDelegate = self;
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
        //注册监听者
        [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        webView;
    });
    [self.view addSubview:self.webView];
    
    self.progressView = ({
        UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        progressView;
    });
    [self.view addSubview:self.progressView];
    
}

#pragma mark -<WKNavigationDelegate>

// 是否加载请求
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    //只能调用一次，否则会不一致报错
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
//
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//
//}

#pragma mark -< KVO Observer Method >

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // 监听 webView 加载进度赋值给进度条
    self.progressView.progress = self.webView.estimatedProgress;
}

@end
