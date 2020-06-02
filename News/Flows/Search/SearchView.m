//
//  SearchView.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchView.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@implementation SearchView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    self.searchBar = [[UISearchBar alloc] init];
    [self addSubview:self.searchBar];
    
    self.tableView = [[UITableView alloc] init];
    [self addSubview:self.tableView];
}

- (void)setupConstraints {
    [self.searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topMargin).with.offset(10);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.height.mas_equalTo(40);
    }];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.bottom).with.offset(10);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottomMargin);
    }];
}

@end
