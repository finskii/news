//
//  Settings.m
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "Settings.h"

@implementation Settings

- (NSString *)updateInterval {
    if (!_updateInterval) {
        _updateInterval = @"5";
    }
    return _updateInterval;
}

- (NSString *)displayInterval {
    if (!_displayInterval) {
        _displayInterval = @"5";
    }
    return _displayInterval;
}

- (NSString *)source {
    if (!_source) {
        _source = @"id_all";
    }
    return _source;
}

@end
