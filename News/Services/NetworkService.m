//
//  NetworkService.m
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "NetworkService.h"
#import "AFNetworking.h"
#import "News.h"

@interface NetworkService ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSDictionary *parameters;

@end

@implementation NetworkService

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 30;
        self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
        //self.manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"text/html", nil];
    }
    return self;
}

- (void) getNewsWithQuery:(NSString *) query
                onSuccess:(void(^)(NSArray *news)) success
                onFailure:(void(^)(NSError *error)) failure {
    
    self.baseUrl = @"https://newsapi.org/v2/top-headlines";
    self.parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"6002257cbc2347fb9a7d5d66a3bf6773",@"apiKey",@"us",@"country",query,@"q",nil];

    [self.manager GET:self.baseUrl parameters:self.parameters headers:nil progress:nil
      success:^(NSURLSessionDataTask * task, NSDictionary * responseObject) {
        //NSLog(@"%@",responseObject);
        NSMutableArray *newsArray = [NSMutableArray new];
        NSArray *articles = [responseObject objectForKey:@"articles"];
        
        for (NSDictionary *jsonObject in articles) {
            News *news = [[News alloc] initWithDictionary:jsonObject];
            [newsArray addObject:news];
        }
        
        if (success) {
            success(newsArray);
        }

    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //NSLog(@"%@",error);
        if (failure) {
            failure(error);
        }
    }];

}

@end
