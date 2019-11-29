//
//  ChannelSource.h
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "RLMObject.h"



@interface ChannelSource : RLMObject

@property (nonatomic, strong) NSString* uuid;
@property (nonatomic, strong) NSString* title;

@end


