//
//  UILabel.h
//
//  Created by finskii on 15/04/16.
//  Copyright © 2016 vi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelHeight)

- (NSInteger) heightForWidth:(NSInteger)width; //needWordWrapping == YES
- (NSInteger) heightForWidth:(NSInteger)width withWordWrappingStyle:(BOOL)needWordWrapping;

@end
