//
//  LZNormalTableViewCell.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/13.
//

#import "LZNormalTableViewCell.h"
#import "LZListModel.h"

@interface LZNormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;
@property (nonatomic, strong, readwrite) UIImageView *coverImageView;
//@property (nonatomic, strong, readwrite) UIButton *deleteButton;
@end

@implementation LZNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:12];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 70, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.coverImageView = [[UIImageView alloc]initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.coverImageView.backgroundColor = [UIColor redColor];
            self.coverImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
    }
    return self;
}

- (void)layoutTableViewCellByModel:(LZListModel *)model{

    self.titleLabel.text = model.title;
    
    self.sourceLabel.text = model.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = model.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(CGRectGetMaxX(self.sourceLabel.frame) + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = model.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(CGRectGetMaxX(self.commentLabel.frame) + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnailPicS1]]];
    
    self.coverImageView.image = image;
}

- (void)deleteBtnClick:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:deleteBtn:)]) {
        [self.delegate tableViewCell:self deleteBtn:sender];
    }
}

@end
