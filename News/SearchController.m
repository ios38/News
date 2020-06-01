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
    //NSLog(@"searchBarText: %@", searchText);
    [self.networkService getNewsWithQuery:query
    onSuccess:^(NSArray * _Nonnull newsArray) {
        NSLog(@"success");
        self.searchResults = newsArray;
        NSLog(@"%lu",(unsigned long)[newsArray count]);
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    News *news = [self.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",news.title];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailController *detailController = [[DetailController alloc] init];
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self getNewsWithQuery:searchText];
}

@end
