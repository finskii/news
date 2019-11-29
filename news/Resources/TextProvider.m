//
//  TextPeovider.m
//  news
//
//  Created by Vasilii Dmitriev on 27.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "TextProvider.h"

@implementation TextProvider

+ (NSString *)empty {
    return @"";
}

+ (NSString *)save {
    return @"save";
}

+(NSString *)ok {
    return @"ok";
}

+ (NSString *)error {
    return @"error";
}

+ (NSString *)navBarTitleNewsList {
    return @"News feed";
}

+ (NSString *)stateNew {
    return @"new";
}

+ (NSString *)stateRead {
    return @"read";
}

+ (NSString *)settings {
    return @"settings";
}

+ (NSString *)navBarTitleSettingst {
    return @"Settings";
}

+ (NSString *)updateInterval {
    return @"Feed update interval in minutes";
}

+ (NSString *)displayInterval {
    return @"Feed display interval in days";
}
+ (NSString *)displaySource {
    return @"Feed source";
}

@end
