//
//  NewsItem.h
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "RLMObject.h"
#import "RSSItem.h"

@interface NewsItem : RLMObject

- (instancetype)initWithRSSItem:(RSSItem*)item;

@property (nonatomic, strong) NSString* guid;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* shortDescription;
@property (nonatomic, strong) NSDate* creationDate;
@property (nonatomic, strong) NSString* source;
@property (nonatomic, strong) NSString* imageUrl;
@property (nonatomic, strong) NSNumber* isRead;

@end

