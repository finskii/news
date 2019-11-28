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
    return [[NewsItem allObjects] sortedResultsUsingKeyPath:@"creationDate" ascending:NO];
}



+ (void) saveSources:(NSArray*)sources {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] addObjects:sources];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<ChannelSource*>*) allSources {
    return [ChannelSource allObjects];
}


+ (void) saveSettings:(Settings*)settings {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] addObject:settings];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<Settings*>*) settings {
    return [Settings allObjects];
}



@end
