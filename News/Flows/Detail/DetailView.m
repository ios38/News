//
//  DetailView.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "DetailView.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@interface DetailView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView* contentView;

@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    self.scrollView = UIScrollView.new;
    [self addSubview:self.scrollView];

    self.contentView = UIView.new;
    [self.scrollView addSubview:self.contentView];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    self.titleLabel.textColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.contentView addSubview:self.titleLabel];
    
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.numberOfLines = 1;
    self.authorLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.authorLabel.textColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.authorLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentView addSubview:self.authorLabel];

    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.numberOfLines = 1;
    self.dateLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.dateLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [self.contentView addSubview:self.dateLabel];

    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.imageView];
    
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    self.descriptionLabel.textColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.contentView addSubview:self.descriptionLabel];
}

- (void)setupConstraints {
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.width);
    }];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).with.offset(10);
        make.left.equalTo(self.contentView.left).with.offset(10);
        make.right.equalTo(self.contentView.right).with.inset(10);
    }];
    [self.authorLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).with.offset(10);
        make.left.equalTo(self.contentView.left).with.offset(10);
        //make.right.equalTo(self.contentView.right).with.inset(10);
    }];
    [self.dateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.top);
        make.left.equalTo(self.authorLabel.right).with.offset(10);
        make.right.equalTo(self.contentView.right).with.inset(10);
    }];
    [self.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLabel.bottom).with.offset(10);
        make.left.equalTo(self.contentView.left);
        make.right.equalTo(self.contentView.right);
        make.height.mas_equalTo(250);
    }];
    [self.descriptionLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.bottom).with.offset(10);
        make.left.equalTo(self.contentView.left).with.offset(10);
        make.right.equalTo(self.contentView.right).with.inset(10);
    }];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.descriptionLabel.bottom).with.offset(300);
    }];
}

@end
