//
//  Settings.h
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "RLMObject.h"


@interface Settings : RLMObject

@property (nonatomic, strong) NSString* updateInterval;
@property (nonatomic, strong) NSString* displayInterval;
@property (nonatomic, strong) NSString* source;

@end

