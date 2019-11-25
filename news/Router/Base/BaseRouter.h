//
//  BaseRouter.h
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseVC.h"
#import "BaseNVC.h"

@interface BaseRouter : NSObject

+ (id) vcByClass:(Class)theClass;

@end

