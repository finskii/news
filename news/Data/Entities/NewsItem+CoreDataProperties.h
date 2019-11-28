//
//  NewsItem+CoreDataProperties.h
//  
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//
//

#import "NewsItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NewsItem (CoreDataProperties)

+ (NSFetchRequest<NewsItem *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *creation_date;
@property (nullable, nonatomic, copy) NSUUID *guid;
@property (nonatomic) BOOL is_read;
@property (nullable, nonatomic, copy) NSString *short_description;
@property (nullable, nonatomic, copy) NSString *source;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
