//
//  NewsInteractor.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIService.h"
#import "DBService.h"

@interface NewsInteractor : NSObject

+ (void) loadNews:(void(^)(RLMResults<NewsItem*>* news, NSObject* error))completion;
+ (void) setNewsItemToReadState:(NewsItem*)item;

+ (NSArray<ChannelSource *> *)allSources;


@end

