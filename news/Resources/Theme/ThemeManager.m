//
//  ThemeManager.m
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeMain.h"

@implementation ThemeManager
@synthesize themeType = m_themeType, theme = m_theme;

static ThemeManager* m_shared;
+ (instancetype)shared {
    if (!m_shared) {
        m_shared = [ThemeManager new];
    }
    return m_shared;
}

- (instancetype)init {
    if (self = [super init]) {
        m_themeType = ThemeTypeMain;
    }
    return self;
}

- (void)setThemeType:(ThemeTypes)themeType {
    m_themeType = themeType;
}

- (id<ThemeProtocol>)theme {
    Class _themeClass;
    
    switch (self.themeType) {
        case ThemeTypeMain: {
            _themeClass = [ThemeMain class];
        }   break;
    }
    
    if (![m_theme isKindOfClass:_themeClass]) {
        m_theme = [_themeClass new];
    }
    
    return m_theme;
}


@end
