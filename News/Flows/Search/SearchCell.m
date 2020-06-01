//
//  SearchCell.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchCell.h"
#import <SDWebImage/SDWebImage.h>
#import "Masonry.h"

@interface SearchCell ()

@property (strong,nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation SearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"dd MMM yyyy hh-mm";
        
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    self.newsImageView = [[UIImageView alloc] init];
    self.newsImageView.layer.cornerRadius = 3;
    self.newsImageView.layer.masksToBounds = YES;
    [self addSubview:self.newsImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.titleLabel];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.textColor = [UIColor lightGrayColor];
    self.dateLabel.numberOfLines = 1;
    self.dateLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.dateLabel];
}

- (void)setupConstraints {
    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.mas_bottom).with.inset(5);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.newsImageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right).with.inset(10);
        //make.bottom.equalTo(self.mas_bottom).with.inset(10);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.newsImageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right).with.inset(10);
        make.bottom.equalTo(self.mas_bottom).with.inset(5);
    }];
}

- (void)configureWithNews:(News *)news {
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:news.imageUrl]
    placeholderImage:[UIImage systemImageNamed:@"questionmark.circle"]];
    self.titleLabel.text = news.title;
    self.dateLabel.text = [self.dateFormatter stringFromDate:news.date];
}

@end
