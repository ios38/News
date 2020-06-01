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
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";

        self.title = [dictionary valueForKey:@"title"];
        self.source = [dictionary valueForKey:@"source"];
        
        NSString *strDate = [dictionary valueForKey:@"publishedAt"];
        self.date = [dateFormatter dateFromString:strDate];

        self.newsDescription = [dictionary valueForKey:@"description"];
        self.content = [dictionary valueForKey:@"content"];
        self.imageUrl = [dictionary valueForKey:@"urlToImage"];
    }
    return self;
}

@end
