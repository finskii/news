//
//  APIService.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "APIService.h"
//@import BlockRSSParser;

@implementation APIService

+ (void) loadDataWithConfig:(NSArray<RequestConfig*>*)configs
                 completion:(void(^)(NSArray* arrChannels, NSError* error))completion {
    
    __block NSMutableArray* _arr = [NSMutableArray new];
    __block NSError* _error;

    dispatch_group_t _group = dispatch_group_create();
    
    for (RequestConfig* _config in configs) {
        dispatch_group_enter(_group);
        
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        [manager GET:_config.rssUrlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"JSON: %@", responseObject);
//            dispatch_group_leave(_group);
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"Error: %@", error);
//            dispatch_group_leave(_group);
//        }];
        
//        [RSSParser parseRSSFeedForRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_config.rssUrlString]] success:^(NSArray *feedItems) {
//
//        } failure:^(NSError *error) {
//
//        }];
        
                    
        RSSParser* _parser = [RSSParser new];

        [_parser parseRSSFeed:_config.rssUrlString
                   parameters:@{}
                      success:^(RSSChannel *channel)
        {
        NSLog(@"Load done from url: %@", _config.rssUrlString);
           if (channel && channel.items.count > 0) {
               [_arr addObject:channel];
           }
           dispatch_group_leave(_group);
        }
                      failure:^(NSError *error)
        {
            _error = error;
            NSLog(@"An error occurred: %@", error);
            dispatch_group_leave(_group);
        }];
    }

    dispatch_group_notify(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        completion(_arr, _error);
    });
    
}

@end
