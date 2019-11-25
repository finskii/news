//
//  APIService.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestConfig.h"

@interface APIService : NSObject

+ (void) loadDataWithConfig:(NSArray<RequestConfig*>*)configs completion:(void(^)(NSArray* arrChannels))completion;

@end

