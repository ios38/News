//
//  SearchView.h
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : UIView

@property (strong,nonatomic) UISearchBar *searchBar;
@property (strong,nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
