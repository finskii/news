//
//  NewsCell.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "NewsCell.h"
#import "ThemeManager.h"

@interface NewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPreview;
@property (weak, nonatomic) IBOutlet UILabel *labelSource;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelShortDescription;

@end

@implementation NewsCell

+ (NSInteger) heightForEntity:(RSSItem*)item
                   isFullView:(BOOL)isFullView {
    
    NSInteger _height = 10+5+5+10;
    NSInteger _width = UIScreen.mainScreen.bounds.size.width;

    UILabel* label = [UILabel new];
    label.text = item.title;
    _height += [label heightForWidth:_width - 159];
    label.text = @"источник";
    _height += [label heightForWidth:_width - 110];
    
    if (isFullView) {
        label.text = item.itemDescription;
        _height += [label heightForWidth:_width - 110];
    }
    
    return _height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelShortDescription.hidden = YES;

}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.item = nil;
}

- (void)setItem:(RSSItem *)item {
    if ([item.guid isEqualToString:_item.guid]) {
        return;
    }
    
    _item = item;
    
    self.labelTitle.text = _item.title;
    self.labelSource.text = @"источник";
    self.labelShortDescription.text = _item.itemDescription;
    
    [self loadImage:_item.link];
    
}

- (void)setIsFullView:(BOOL)isFullView {
    self.labelShortDescription.hidden = !isFullView;
}

- (void) loadImage:(NSURL*)url {
    
    __weak typeof(self) _weakSelf = self;
    
    [self.imageViewPreview sd_setImageWithURL:url completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType, NSURL * imageURL)
    {
        if (!error &&
            image &&
            [imageURL.absoluteString isEqualToString:url.absoluteString])
        {
            _weakSelf.imageViewPreview.image = image;
        }
    }];
}

@end
