//
//  LZDeleteCellView.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/14.
//

#import "LZDeleteCellView.h"

@interface LZDeleteCellView ()

@property (nonatomic, strong, readwrite) UIView *backgroundView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;
@property (nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation LZDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initViews];
    }
    return self;
}

#pragma mark -< lift cycle >

- (void)showDeleteViewFromPint:(CGPoint)point closeBlock:(dispatch_block_t)closeBlock{
    
    self.deleteBlock =  [closeBlock copy];
    
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    
    //将弹窗加载到 window 上
    [UIApplication.sharedApplication.windows.lastObject addSubview:self];
    
    [UIView animateWithDuration:0.7f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.deleteButton.frame = CGRectMake(self.bounds.size.width/2 - 100, self.bounds.size.height/2 - 100, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

#pragma mark -< init SubViews >

- (void)_initViews {
    
    self.backgroundView = ({
        UIView *view = [[UIView alloc]initWithFrame:self.bounds];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        // 背景添加点击事件，执行隐藏弹窗
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_clickAction)]];
        view;
    });
    [self addSubview:self.backgroundView];
    
    self.deleteButton = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [button addTarget:self action:@selector(_clickAction) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor redColor];
        button;
    });
    [self addSubview:self.deleteButton];
}

- (void)_clickAction {
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    [self dismissDeleteView];
}

@end
