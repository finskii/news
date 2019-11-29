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
@property (weak, nonatomic) IBOutlet UILabel *labelState;

@end

@implementation NewsCell

+ (NSInteger) heightForEntity:(NewsItem*)item
                   isFullView:(BOOL)isFullView {
    
    NSInteger _height = 40;
    NSInteger _width = UIScreen.mainScreen.bounds.size.width;

    UILabel* label = [UILabel new];
    label.text = item.source;

    _height += [label heightForWidth:_width - 169];
    label.text = item.title;
    _height += [label heightForWidth:_width - 130];
    
    if (isFullView) {
        label.text = item.shortDescription;
        _height += [label heightForWidth:_width - 120];
    }
    
    if (_height > 100) {
        return _height;
    } else {
        return 100;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelShortDescription.hidden = YES;
    self.imageViewPreview.image = nil;

}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.item = nil;
    self.imageViewPreview.image = nil;
    [self.imageViewPreview sd_cancelCurrentImageLoad];
}

- (void)setItem:(NewsItem *)item {
    if ([item.guid isEqualToString:_item.guid]) {
        return;
    }
    
    _item = item;
    
    self.labelTitle.text = _item.title;
    self.labelSource.text = _item.source;
    
    if ([NSURL URLWithString:_item.imageUrl]) {
        [self loadImage:[NSURL URLWithString:_item.imageUrl]];
    } else {
        self.imageViewPreview.image = [ImageProvider imageEmptyPreview];
    }
    
    [ThemeManager.shared.theme labelItemState:self.labelState isRead:_item.isRead && _item.isRead.boolValue];
    
}


- (void)setIsFullView:(BOOL)isFullView {
    if (isFullView) {
        self.labelShortDescription.text = _item.shortDescription;
        self.labelShortDescription.hidden = NO;
    } else {
        self.labelShortDescription.text = nil;
        self.labelShortDescription.hidden = YES;
    }
}

- (void) fillDesign {
}

- (void) loadImage:(NSURL*)url {
    
    __weak typeof(self) _weakSelf = self;
    [self.imageViewPreview sd_setImageWithURL:url completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType, NSURL * imageURL)
    {
        if (!error)
        {
            self.imageViewPreview.image = nil;
            _weakSelf.imageViewPreview.image = image;
        } else {
            
        }
    }];
}

@end
