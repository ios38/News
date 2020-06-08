//
//  NetworkService.h
//  News
//
//  Created by Maksim Romanov on 01.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

- (void) getNewsWithQuery:(NSString *) query
onSuccess:(void(^)(NSArray *news)) success
onFailure:(void(^)(NSError *error)) failure;

@end

NS_ASSUME_NONNULL_END
