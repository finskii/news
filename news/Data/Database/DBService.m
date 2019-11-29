//
//  DBService.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "DBService.h"

@implementation DBService

+ (void)saveNews:(NSArray<NewsItem *> *)arrNews {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    @try {
        [[RLMRealm defaultRealm] addObjects:arrNews];
    } @catch (NSException *exception) {
        NSLog(@"got a duplicate");
    }
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (void) setNewsItemToReadState:(NewsItem*)item {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    item.isRead = @"YES";
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<NewsItem *>*) allNews {
    Settings* _settings;
    if ([[self settings] count] > 0) {
        _settings = [[self settings] firstObject];
    } else {
        _settings = [Settings new];
    }
    
    if (![_settings.source isEqualToString:@"id_all"]) {
            return [[NewsItem objectsWhere:[NSString stringWithFormat:@"source = '%@'", _settings.source]]
                sortedResultsUsingKeyPath:@"creationDate" ascending:NO];
    } else {
        return [[NewsItem allObjects] sortedResultsUsingKeyPath:@"creationDate" ascending:NO];
    }
}

// AND creationDate BEGINSWITH 'B'

+ (void) saveSources:(NSArray*)sources {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    @try {
        [[RLMRealm defaultRealm] addObjects:sources];
    } @catch (NSException *exception) {
        NSLog(@"got a duplicate");
    }
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<ChannelSource*>*) allSources {
    return [ChannelSource allObjects];
}

+ (RLMResults<ChannelSource*>*) currentSource {    
    return [ChannelSource objectsWhere:[NSString stringWithFormat:@"uuid = '%@'", [[[self settings] firstObject] source]]];
}


+ (void) saveSettings:(Settings*)settings {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] addObject:settings];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (void)saveSettings:(Settings*)settings
update:(NSString *)update
     display:(NSString *)display
source:(NSString *)source {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    settings.updateInterval = update;
    settings.displayInterval = display;
    settings.source = source;
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<Settings*>*) settings {
    return [Settings allObjects];
}



@end
