//
//  ThemeMain.m
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "ThemeMain.h"

@implementation ThemeMain

- (void)labelItemState:(UILabel *)label
                isRead:(BOOL)isRead {
    if (isRead) {
        label.text = [TextPeovider stateRead];
        label.backgroundColor = UIColor.lightGrayColor;
    } else {
        label.text = [TextPeovider stateNew];
        label.backgroundColor = UIColor.greenColor;
    }
    label.layer.cornerRadius = label.frame.size.height/2;
    label.clipsToBounds = YES;
}

@end
