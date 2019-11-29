//
//  SettingsInteractor.h
//  news
//
//  Created by Vasilii Dmitriev on 29.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBService.h"
#import "Settings.h"

@interface SettingsInteractor : NSObject

+ (Settings*)settings;

+ (void) saveSettings:(Settings*)settings;

@end

