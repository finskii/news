//
//  DBService.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"
#import "Settings.h"
#import "ChannelSource.h"
#import <Realm/Realm.h>

@interface DBService : NSObject

+ (void) saveNews:(NSArray<NewsItem *> *)arrNews;
+ (void) setNewsItemToReadState:(NewsItem*)item;

+ (void) saveSources:(NSSet*)sources;

+ (RLMResults<NewsItem *>*) allNews;
+ (RLMResults*) allSources;
+ (RLMResults<ChannelSource*>*) currentSource;

+ (RLMResults<Settings*>*) settings;
+ (void) saveSettings:(Settings*)settings;
+ (void)saveSettings:(Settings*)settings
update:(NSString *)update
     display:(NSString *)display
              source:(NSString *)source;

@end

