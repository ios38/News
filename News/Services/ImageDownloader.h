//
//  ImageDownloader.h
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDownloader : NSObject

+ (UIImage *)imageWithUrl:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
