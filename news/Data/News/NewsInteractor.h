//
//  NewsInteractor.h
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsInteractor : NSObject

+ (void) loadNews:(void(^)(NSArray* news, NSObject* error))completion;

@end

