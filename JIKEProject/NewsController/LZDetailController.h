//
//  LZdetailController.h
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 新闻详情页面对应的 Controller，点击新闻跳转到此页面
 */
@interface LZDetailController : UIViewController

- (instancetype)initWithURlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
