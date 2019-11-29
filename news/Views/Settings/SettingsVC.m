//
//  SettingsVC.m
//  news
//
//  Created by Vasilii Dmitriev on 28.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "SettingsVC.h"
#import "SettingsInteractor.h"
#import "NewsInteractor.h"

@interface SettingsVC()

@property (weak, nonatomic) IBOutlet UILabel *labelUpdateInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUpdateInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDisplayInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelSource;
@property (weak, nonatomic) IBOutlet UIButton *buttonSource;

@property (nonatomic, strong) Settings* settings;
@property (nonatomic, strong) NSArray<ChannelSource*>* arrSources;

@end

@implementation SettingsVC

#pragma mark - set/get


#pragma mark - override

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelUpdateInterval.text = [TextProvider updateInterval];
    self.labelDisplayInterval.text = [TextProvider displayInterval];
    self.labelSource.text = [TextProvider displaySource];

    [self fillUI];
    
}


#pragma mark - private

- (void) fillUI {
    
    self.settings = [SettingsInteractor settings];
    self.arrSources = [NewsInteractor allSources];
    
    self.textFieldUpdateInterval.text = self.settings.updateInterval;
    self.textFieldDisplayInterval.text = self.settings.displayInterval;
    [self.buttonSource setTitle:self.settings.source forState:UIControlStateNormal];
    
}


#pragma mark - handlers

@end
