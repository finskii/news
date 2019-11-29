//
//  BaseNVC.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "BaseNVC.h"

@interface BaseNVC ()

@end

@implementation BaseNVC


- (instancetype)init {
    if (self = [super init]) {
        [self.navigationBar setTranslucent:NO];
    }
    return self;
}


@end
