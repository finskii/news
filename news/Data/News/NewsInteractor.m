//
//  NewsInteractor.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "NewsInteractor.h"
#import "APIService.h"

@implementation NewsInteractor

+ (void) loadNews:(void(^)(NSArray* news, NSObject* error))completion {
    
    RequestConfig* _config1 = [RequestConfig new];
    _config1.rssUrlString = @"http://lenta.ru/rss";
    RequestConfig* _config2 = [RequestConfig new];
    _config2.rssUrlString = @"http://www.gazeta.ru/export/rss/lenta.xml";
    
    [APIService loadDataWithConfig:@[_config1, _config2] completion:^(NSArray *arrChannels, NSError* error) {
        NSMutableArray* _arr = [NSMutableArray new];
        if (!error) {
            for (RSSChannel* _channel in arrChannels) {
                [_arr addObjectsFromArray:_channel.items];
                for (RSSItem* _item in _arr) {
                    if (!_item.authorEmail) {
                        _item.authorEmail = _channel.title;
                    }
                }
            }
        }
        completion(_arr, error);
    }];
}

@end
