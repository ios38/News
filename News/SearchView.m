//
//  SearchView.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchView.h"
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
        //[self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    //self.searchBar = [[UISearchBar alloc] init];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 95, self.bounds.size.width, 40)];
    [self addSubview:self.searchBar];
    
    //self.tableView = [[UITableView alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, self.bounds.size.width, self.bounds.size.height - 180)];
    [self addSubview:self.tableView];
}

- (void)setupConstraints {
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(30);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}

@end
