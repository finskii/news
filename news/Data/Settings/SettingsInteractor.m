//
//  SettingsInteractor.m
//  news
//
//  Created by Vasilii Dmitriev on 29.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "SettingsInteractor.h"

@implementation SettingsInteractor

+ (Settings *)settings {
    if ([[DBService settings] count] > 0) {
        return [[DBService settings] firstObject];
    } else {
        return [Settings new];
    }
}

+ (void)saveSettings:(Settings *)settings {
    [DBService saveSettings:settings];
}

@end
