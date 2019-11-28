//
//  DBService.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"
#import <Realm/Realm.h>

@interface DBService : NSObject

+ (void) saveNews:(NSArray<NewsItem *> *)arrNews;
+ (void) setNewsItemToReadState:(NewsItem*)item;

+ (RLMResults<NewsItem *>*) allNews;

@end

