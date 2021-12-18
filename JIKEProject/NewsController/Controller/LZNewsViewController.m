//
//  ViewController.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/11.
//

#import "LZNewsViewController.h"
#import "LZNormalTableViewCell.h"
#import "LZDetailController.h"
#import "LZDeleteCellView.h"
#import "LZListLoader.h"
#import "LZListModel.h"

@interface LZNewsViewController ()<UITableViewDelegate, UITableViewDataSource, LZNormalTableViewCellDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, copy, readwrite) NSArray *modelArray;     //数据模型数组
@property (nonatomic, strong, readwrite) LZListLoader *listLoader;  // 网络数据请求类

@end

@implementation LZNewsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
        
        self.listLoader = [LZListLoader new];
        [self.listLoader loadListData:^(BOOL success, NSArray<LZListModel *> * _Nonnull dataArray) {
            self.modelArray = dataArray;
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark -<UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LZNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [LZNormalTableViewCell new];
        cell.delegate = self;
    }
    
    [cell layoutTableViewCellByModel:[self.modelArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark -<UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LZListModel *model = [self.modelArray objectAtIndex:indexPath.row];
    LZDetailController *detailController = [[LZDetailController alloc]initWithURlString:model.url];
    detailController.title = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark -<LZNormalTableViewCellDelegate>

//- (void)tableViewCell:(UITableViewCell *)tableViewCell deleteBtn:(UIButton *)deleteBtn {
//    LZDeleteCellView *deleteView = [[LZDeleteCellView alloc]initWithFrame:self.view.bounds];
//
//    CGRect rect = [tableViewCell convertRect:deleteBtn.frame toView:nil];
//
//    // 防止循环引用
//    __weak typeof(self) wself = self;
//    [deleteView showDeleteViewFromPint:rect.origin closeBlock:^{
//        __strong typeof(self) strongSelf = wself;
//        NSIndexPath *indexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
//        [strongSelf.dataArray removeLastObject];
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
//}

@end
