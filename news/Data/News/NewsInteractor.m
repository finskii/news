//
//  NewsInteractor.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "NewsInteractor.h"

static NSString* urlLenta = @"http://lenta.ru/rss";
static NSString* urlGazeta = @"http://www.gazeta.ru/export/rss/lenta.xml";

@implementation NewsInteractor

+ (void) loadNews:(void(^)(RLMResults<NewsItem*>* news, NSObject* error))completion {
    
    completion([DBService allNews], nil);
    
    RequestConfig* _config1 = [RequestConfig new];
    _config1.rssUrlString = urlLenta;
    RequestConfig* _config2 = [RequestConfig new];
    _config2.rssUrlString = urlGazeta;
    
    
    [APIService loadDataWithConfig:@[_config1, _config2] completion:^(NSArray *arrChannels, NSError* error) {
        NSMutableArray* _arrNewsItems = [NSMutableArray new];
        if (!error) {
            for (RSSChannel* _channel in arrChannels) {
                for (RSSItem* _item in _channel.items) {
                    if (!_item.authorEmail) {
                        _item.authorEmail = _channel.title;
                    }
                    [_arrNewsItems addObject:[[NewsItem alloc] initWithRSSItem:_item]];
                }
            }
            [DBService saveNews:_arrNewsItems];
        }
        completion([DBService allNews], error);
    }];
}

+ (void) setNewsItemToReadState:(NewsItem*)item {
    [DBService setNewsItemToReadState:item];
}

@end
