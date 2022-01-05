//
//  LZNormalTableViewCell.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/12/13.
//

#import "LZNormalTableViewCell.h"
#import "LZListModel.h"
#import "SDWebImage.h"

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
        
        [self _initView];
    }
    return self;
}

#pragma mark -< init SubViews and load data >

- (void)_initView {
    
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(15);
        make.size.equalTo(CGSizeMake(270, 50));
    }];
    
    self.sourceLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        label;
    });
    [self.contentView addSubview:self.sourceLabel];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.bottom).offset(5);
    }];
    
    
    self.commentLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        label;
    });
    [self.contentView addSubview:self.commentLabel];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceLabel.right).offset(15);
        make.top.equalTo(self.sourceLabel);
    }];
    
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        label;
    });
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentLabel.right).offset(15);
        make.top.equalTo(self.sourceLabel);
    }];
    
    self.coverImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView;
    });
    [self.contentView addSubview:self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(15);
        make.size.equalTo(CGSizeMake(100, 70));
    }];

    
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton addTarget:self action:@selector(_deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
}

#pragma mark -< public method >

- (void)layoutTableViewCellByModel:(LZListModel *)model{
        
    self.titleLabel.text = model.title;
    
    self.sourceLabel.text = model.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = model.category;
    
    self.timeLabel.text = model.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(CGRectGetMaxX(self.commentLabel.frame) + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnailPicS1]];
    
}

#pragma mark -< private method >

- (void)_deleteBtnClick:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:deleteBtn:)]) {
        [self.delegate tableViewCell:self deleteBtn:sender];
    }
}

@end
