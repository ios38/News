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
        
        if ([dictionary valueForKey:@"author"] != (id)[NSNull null]) {
            self.author = [dictionary valueForKey:@"author"];
        } else if ([dictionary valueForKey:@"source"] != (id)[NSNull null]) {
            NSDictionary *sourceDict = [dictionary valueForKey:@"source"];
            self.author = [sourceDict valueForKey:@"name"];
        };
        
        NSString *strDate = [dictionary valueForKey:@"publishedAt"];
        self.date = [dateFormatter dateFromString:strDate];

        self.newsDescription = [dictionary valueForKey:@"description"];
        self.content = [dictionary valueForKey:@"content"];
        self.imageUrl = [dictionary valueForKey:@"urlToImage"];
        //NSLog(@"%@",self.imageUrl);
    }
    return self;
}

@end
