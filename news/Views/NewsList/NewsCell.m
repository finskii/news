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

+ (NSInteger) heightForEntity:(RSSItem*)item
                   isFullView:(BOOL)isFullView {
    
    NSInteger _height = 40;
    NSInteger _width = UIScreen.mainScreen.bounds.size.width;

    UILabel* label = [UILabel new];
    if (item.authorEmail) {
        label.text = item.authorEmail;
    } else {
        label.text = @"source";
    }
    _height += [label heightForWidth:_width - 169];
    label.text = item.title;
    _height += [label heightForWidth:_width - 130];
    
    if (isFullView) {
        label.text = item.itemDescription;
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

- (void)setItem:(RSSItem *)item {
    if ([item.guid isEqualToString:_item.guid]) {
        return;
    }
    
    _item = item;
    
    self.labelTitle.text = _item.title;
    self.labelSource.text = _item.authorEmail;
    
    
    if (item.authorEmail) {
        self.labelSource.text = _item.authorEmail;
    } else {
        self.labelSource.text = @"source";
    }
    
    if ([_item mediaThumbnails].count > 0) {
        [self loadImage:[[_item mediaThumbnails] firstObject]];
    } else {
        self.imageViewPreview.image = [ImageProvider imageEmptyPreview];
    }
}


- (void)setIsFullView:(BOOL)isFullView {
    if (isFullView) {
        self.labelShortDescription.text = _item.itemDescription;
        self.labelShortDescription.hidden = NO;
        [ThemeManager.shared.theme labelItemState:self.labelState isRead:YES];
    } else {
        self.labelShortDescription.text = nil;
        self.labelShortDescription.hidden = YES;
        [ThemeManager.shared.theme labelItemState:self.labelState isRead:NO];

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
