//
//  NewsCell.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSItem.h"

@interface NewsCell : UITableViewCell
    
@property (nonatomic, strong) RSSItem* item;

@end

