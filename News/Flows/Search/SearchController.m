//
//  SearchController.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchController.h"
#import "SearchView.h"
#import "DetailController.h"
#import "NetworkService.h"
#import "News.h"
#import "SearchCell.h"

@interface SearchController ()

@property (strong,nonatomic) SearchView *searchView;
@property (strong,nonatomic) NetworkService *networkService;
@property (strong,nonatomic) NSArray *searchResults;

@end

@implementation SearchController

- (void)loadView {
    [super loadView];
    self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    self.view = self.searchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.networkService = [[NetworkService alloc] init];
    self.searchView.searchBar.delegate = self;
    self.searchView.tableView.dataSource = self;
    self.searchView.tableView.delegate = self;
    [self getNewsWithQuery:@""];
}

- (void)getNewsWithQuery:(NSString * _Nullable)query {
    [self.networkService getNewsWithQuery:query
    onSuccess:^(NSArray * _Nonnull newsArray) {
        self.searchResults = newsArray;
        [self.searchView.tableView reloadData];
    }
    onFailure:^(NSError * _Nonnull error) {
        NSLog(@"error: %@", [error localizedDescription]);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    News *news = [self.searchResults objectAtIndex:indexPath.row];
    [cell configureWithNews:news];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailController *detailController = [[DetailController alloc] init];
    News *news = [self.searchResults objectAtIndex:indexPath.row];
    detailController.news = news;
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self getNewsWithQuery:searchText];
}

@end
