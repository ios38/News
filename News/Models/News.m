//
//  News.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary valueForKey:@"title"];
        self.source = [dictionary valueForKey:@"source"];
        self.date = [dictionary valueForKey:@"publishedAt"];
        self.newsDescription = [dictionary valueForKey:@"description"];
        self.content = [dictionary valueForKey:@"content"];
        self.imageUrl = [dictionary valueForKey:@"urlToImage"];
    }
    return self;
}

@end
