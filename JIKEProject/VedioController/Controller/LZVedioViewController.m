//
//  LZVedioViewController.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/20.
//

#import "LZVedioViewController.h"
#import "LZVedioCollectionViewCell.h"

@interface LZVedioViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;

@end

@implementation LZVedioViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _initView];
}

#pragma mark -< init subViews >

- (void)_initView {
    
    UICollectionViewFlowLayout *flowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.itemSize = CGSizeMake(SCREENWIDTH, 232);
        flowLayout;
    });
    
    self.collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[LZVedioCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([LZVedioCollectionViewCell class])];
        collectionView;
    });
    [self.view addSubview:self.collectionView];
}

#pragma mark -< UICollectionViewDataSource >

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZVedioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LZVedioCollectionViewCell class]) forIndexPath:indexPath];
    [cell layoutWithVideoCoverUrl:@"" videoUrl:@"http://112.124.13.126:8080/resource/lz.mp4"];
    return cell;
}



@end
