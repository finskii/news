//
//  UILabel.m
//
//  Created by finskii on 15/04/16.
//  Copyright © 2016 vi. All rights reserved.
//

#import "UILabel+LabelHeight.h"
#include <CoreText/CTFramesetter.h>


@implementation UILabel (LabelHeight)

- (NSInteger) heightForWidth:(NSInteger)width {
    return [self heightForWidth:width withWordWrappingStyle:YES];
}

- (NSInteger) heightForWidth:(NSInteger)width withWordWrappingStyle:(BOOL)needWordWrapping {
    if (!self.text) {
        return 0;
    }
    
    NSMutableAttributedString* _attrString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    if (!self.attributedText) {
        _attrString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    
    if ([_attrString.string isEqualToString:@""]) {
        return 0;
    }
    
    if (needWordWrapping) {
        NSMutableParagraphStyle *_style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [_style setLineBreakMode:NSLineBreakByWordWrapping];
        [_attrString addAttribute:NSParagraphStyleAttributeName value:_style range:NSMakeRange(0, _attrString.length)];
    }
    
    CGSize _size = CGSizeMake(width, CGFLOAT_MAX);
    CGRect _rect = [_attrString boundingRectWithSize:_size
                                             options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                             context:nil];
    
    return CGRectGetHeight(_rect);
}

@end
