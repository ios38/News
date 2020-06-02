//
//  News.h
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject


@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic,nullable) NSString *author;
@property (strong,nonatomic) NSDate *date;
@property (strong,nonatomic,nullable) NSString *newsDescription;
@property (strong,nonatomic,nullable) NSString *content;
@property (strong,nonatomic,nullable) NSString *imageUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
