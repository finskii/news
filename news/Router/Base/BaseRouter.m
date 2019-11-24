//
//  BaseRouter.m
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "BaseRouter.h"

@implementation BaseRouter

- (id) vcByClass:(Class)theClass {
    
    UIStoryboard* _sb = [UIStoryboard storyboardWithName:NSStringFromClass(theClass) bundle:nil];
    id _vc = [_sb instantiateViewControllerWithIdentifier:NSStringFromClass(theClass)];
    return _vc;
    
}
    

@end
