//
//  APIService.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "APIService.h"
@import MediaRSSParser;

@implementation APIService

+ (void) loadDataWithConfig:(NSArray<RequestConfig*>*)configs completion:(void(^)(NSArray* arrChannels))completion {
    
    __block NSMutableArray* _arr = [NSMutableArray new];

    dispatch_group_t _group = dispatch_group_create();
    
    for (RequestConfig* _config in configs) {
        RSSParser* _parser = [RSSParser new];
        dispatch_group_enter(_group);
        [_parser parseRSSFeed:_config.rssUrlString
                   parameters:@{}
                      success:^(RSSChannel *channel)
        {
        NSLog(@"Load done from url: %@", _config.rssUrlString);
           if (channel && channel.items.count > 0) {
               [_arr addObjectsFromArray:channel.items];
           }
           dispatch_group_leave(_group);
        }
                      failure:^(NSError *error)
        {
            NSLog(@"An error occurred: %@", error);
            dispatch_group_leave(_group);
        }];
    }
    // to use it as a completion handler
    dispatch_group_notify(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        completion(_arr);
    });
    
    
}

@end
