//
//  SearchCell.h
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchCell : UITableViewCell

@property (strong, nonatomic) UIImageView *newsImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *dateLabel;

- (void)configureWithNews:(News *)news;

@end

NS_ASSUME_NONNULL_END
