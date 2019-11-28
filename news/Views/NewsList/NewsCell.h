//
//  NewsCell.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsCell : UITableViewCell
    
+ (NSInteger) heightForEntity:(NewsItem*)item
                   isFullView:(BOOL)isFullView;

@property (nonatomic, strong) NewsItem* item;
@property (nonatomic, assign) BOOL isFullView;

@end

