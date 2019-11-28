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
    [[RLMRealm defaultRealm] addObjects:arrNews];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (void) updateNewsItem:(NewsItem*)item {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] addOrUpdateObject:item];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

+ (RLMResults<NewsItem *>*) allNews {

    return [NewsItem allObjects];// objectsWhere:@"color = 'tan' AND name BEGINSWITH 'B'"];

}

@end
