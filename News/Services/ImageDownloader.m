//
//  ImageDownloader.m
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

+ (UIImage *)imageWithUrl:(NSString *)imageUrl {
    NSData *imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    if (imageData) {
        return [UIImage imageWithData:imageData];
    } else {
        return [UIImage systemImageNamed:@"questionmark.circle"];
    }
}

@end
