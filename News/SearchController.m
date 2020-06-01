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

@interface SearchController ()

@property (strong,nonatomic) SearchView *searchView;

@end

@implementation SearchController

- (void)loadView {
    [super loadView];
    self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    self.view = self.searchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.searchBar.delegate = self;
    self.searchView.tableView.dataSource = self;
    self.searchView.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",(long)indexPath.row];
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
    if ([searchText  isEqual: @""]) {
        //self.searchResults = @[];
        //[self.searchView.tableView reloadData];

    } else {
        NSLog(@"searchBarText: %@", searchText);
        //[self.searchService getAppsWithQuery:searchText
        //onSuccess:^(NSArray * _Nonnull iTunesApps) {
        //    self.searchResults = iTunesApps;
        //    [self.searchView.tableView reloadData];
        //}
        //onFailure:^(NSError * _Nonnull error) {
        //    NSLog(@"error: %@", [error localizedDescription]);
        //}];
        
    }
}

@end
