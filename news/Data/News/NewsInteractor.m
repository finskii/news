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
        NSMutableArray* _arrChannelSources = [NSMutableArray new];
        if (!error) {
            for (RSSChannel* _channel in arrChannels) {
                ChannelSource* _channelSource = [ChannelSource new];
                _channelSource.title = _channel.title;
                _channelSource.uuid = _channel.title;
                [_arrChannelSources addObject:_channelSource];
                for (RSSItem* _item in _channel.items) {
                    _item.authorEmail = _channel.title;
                    [_arrNewsItems addObject:[[NewsItem alloc] initWithRSSItem:_item]];
                }
            }            
            
            [DBService saveSources:_arrChannelSources.copy];
            [DBService saveNews:_arrNewsItems.copy];
        }
        completion([DBService allNews], error);
    }];
}

+ (void) setNewsItemToReadState:(NewsItem*)item {
    [DBService setNewsItemToReadState:item];
}

+ (NSArray<ChannelSource *> *)allSources {
    NSMutableArray* _arr = [NSMutableArray new];
    [_arr addObject:[ChannelSource new]];
    for (ChannelSource* _channelSource in [DBService allSources]) {
        [_arr addObject:_channelSource];
    }
    return _arr.copy;
}

+ (ChannelSource*) currentSource {
    if ([DBService currentSource].count > 0) {
        return [DBService currentSource].firstObject;
    } else {
        return [ChannelSource new];
    }
}

@end
