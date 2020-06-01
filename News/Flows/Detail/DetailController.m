//
//  DetailController.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "DetailController.h"
#import "DetailView.h"
#import <SDWebImage/SDWebImage.h>
#import "ImageDownloader.h"

@interface DetailController ()

@property (strong,nonatomic) DetailView *detailView;
@property (strong,nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation DetailController

- (void)loadView {
    [super loadView];
    self.detailView = [[DetailView alloc] initWithFrame:self.view.frame];
    self.view = self.detailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"dd MMM yyyy hh-mm";
    
    self.detailView.titleLabel.text = self.news.title;
    self.detailView.dateLabel.text = [self.dateFormatter stringFromDate:self.news.date];
    [self.detailView.imageView sd_setImageWithURL:[NSURL URLWithString:self.news.imageUrl]];
    self.detailView.descriptionLabel.text = [NSString stringWithFormat:@"%@",self.news.newsDescription];
}

@end
