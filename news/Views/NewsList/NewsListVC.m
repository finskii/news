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

@interface NewsListVC() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* arrNews;

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


#pragma mark - handlers


#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell* _cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsCell class])
                                                      forIndexPath:indexPath];
    
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}





@end
