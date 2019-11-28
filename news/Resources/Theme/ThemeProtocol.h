//
//  ThemeProtocol.h
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UILabel+LabelHeight.h"
#import <SDWebImage/SDWebImage.h>
#import "ImageProvider.h"
#import "TextProvider.h"

@protocol ThemeProtocol <NSObject>

- (void) labelItemState:(UILabel*)label
                 isRead:(BOOL)isRead;

@end
