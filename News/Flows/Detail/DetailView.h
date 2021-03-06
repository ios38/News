//
//  DetailView.h
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailView : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *descriptionLabel;

@end

NS_ASSUME_NONNULL_END
