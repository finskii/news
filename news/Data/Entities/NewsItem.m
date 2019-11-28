//
//  NewsItem.m
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

- (instancetype)initWithRSSItem:(RSSItem *)item {
    
    if (self =[super init]) {
        
        self.guid = item.guid;
        self.title = item.title;
        self.shortDescription = item.itemDescription;
        self.creationDate = item.pubDate;
        self.source = item.authorEmail;
        if (item.imagesFromItemDescription.count > 0) {
            self.imageUrl = item.imagesFromItemDescription.firstObject;
        }
        
        
    }
    
    return self;
}

+ (NSString *)primaryKey {
    return @"guid";
}

@end
