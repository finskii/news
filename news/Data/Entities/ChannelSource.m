//
//  ChannelSource.m
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "ChannelSource.h"

@implementation ChannelSource

- (NSString *)uuid {
    if (!_uuid) {
        _uuid = @"all_id";
    }
    return _uuid;
}

- (NSString *)title {
    if (!_title) {
        _title = @"All";
    }
    return _title;
}

@end