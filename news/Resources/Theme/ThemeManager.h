//
//  ThemeManager.h
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "ThemeProtocol.h"
#import "UILabel+LabelHeight.h"
#import <SDWebImage/SDWebImage.h>

typedef NS_ENUM(NSInteger, ThemeTypes) {
    ThemeTypeMain = 0
};


@interface ThemeManager : NSObject

+ (instancetype)shared;

@property (nonatomic) ThemeTypes themeType;
@property (nonatomic, readonly) id<ThemeProtocol> theme;

@end
