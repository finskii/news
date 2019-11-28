//
//  NewsItem+CoreDataProperties.m
//  
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//
//

#import "NewsItem+CoreDataProperties.h"

@implementation NewsItem (CoreDataProperties)

+ (NSFetchRequest<NewsItem *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"NewsItem"];
}

@dynamic creation_date;
@dynamic guid;
@dynamic is_read;
@dynamic short_description;
@dynamic source;
@dynamic title;

@end
