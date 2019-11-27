//
//  NewsListVC.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "NewsListVC.h"
#import "NewsCell.h"
#import "NewsInteractor.h"
#import "ThemeManager.h"

@interface NewsListVC() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* arrNews;
@property (nonatomic, strong) RSSItem* selectedItem;

@end

@implementation NewsListVC

#pragma mark - set/get

- (NSArray *)arrNews {
    if (!_arrNews) {
        _arrNews = [NSArray new];
    }
    return _arrNews;
}

#pragma mark - override

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [TextPeovider navBarTitleNewsList];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsCell class])
                                               bundle:NSBundle.mainBundle]
         forCellReuseIdentifier:NSStringFromClass([NewsCell class])];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    __weak typeof(self) _weakSelf = self;
    
    [NewsInteractor loadNews:^(NSArray *news, NSObject *error) {
        if (!error) {
            _weakSelf.arrNews = news;
            [_weakSelf.tableView reloadData];
        } else {
            
        }
    }];
}

#pragma mark - private

- (void) updateSelectedItem:(RSSItem*)item {
    if ([self.selectedItem.guid isEqualToString:item.guid]) {
        self.selectedItem = nil;
    } else {
        self.selectedItem = item;
    }
}

- (BOOL) shouldBeFullView:(RSSItem*)item {
    return [item.guid isEqualToString:self.selectedItem.guid];
}

#pragma mark - handlers


#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.arrNews.count) {
        RSSItem* _item = [self.arrNews objectAtIndex:indexPath.row];
        return [NewsCell heightForEntity:_item
                              isFullView:[self shouldBeFullView:_item]];
    } else {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell* _cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsCell class])
                                                      forIndexPath:indexPath];
    
    if (indexPath.row < self.arrNews.count) {
        RSSItem* _item = [self.arrNews objectAtIndex:indexPath.row];
        _cell.item = _item;
        _cell.isFullView = [self shouldBeFullView:_item];
    }
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //decided to fullSize in an easy way wo protocol
    if (indexPath.row < self.arrNews.count) {
        [self updateSelectedItem:[self.arrNews objectAtIndex:indexPath.row]];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}





@end
