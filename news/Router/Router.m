//
//  Router.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "Router.h"
#import "NewsListVC.h"
#import "SettingsVC.h"

@implementation Router

+ (void) gotoMainViewFrom:(UIWindow*)window {
    
    BaseVC* _vc = [self vcByClass:[NewsListVC class]];
    BaseNVC* _nvc = [[BaseNVC alloc] initWithRootViewController:_vc];

    [_nvc.navigationBar setTranslucent:NO];
    window.rootViewController = _nvc;
    [window makeKeyAndVisible];

}

+ (void) pushSettingsFrom:(BaseVC*)fromVC {
    
    BaseVC* _vc = [self vcByClass:[SettingsVC class]];
    [_vc.navigationController.navigationBar setTranslucent:NO];
    [fromVC.navigationController pushViewController:_vc animated:YES];
}

@end
