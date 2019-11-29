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

@interface SettingsVC() <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelUpdateInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUpdateInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDisplayInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelSource;
@property (weak, nonatomic) IBOutlet UIButton *buttonSource;

@property (nonatomic, strong) Settings* settings;
@property (nonatomic, strong) NSArray<ChannelSource*>* arrSources;
@property (nonatomic, strong) ChannelSource* selectedSource;

@end

@implementation SettingsVC

#pragma mark - set/get


#pragma mark - override

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [TextProvider navBarTitleSettingst];
    
    UIGestureRecognizer* _reco = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    [self.view addGestureRecognizer:_reco];
    
    UIBarButtonItem* _buttonSettings = [[UIBarButtonItem alloc] initWithTitle:[TextProvider save] style:UIBarButtonItemStylePlain target:self action:@selector(saveSettings)];
    self.navigationItem.rightBarButtonItem = _buttonSettings;
    
    self.textFieldDisplayInterval.delegate = self;
    self.textFieldUpdateInterval.delegate = self;
    
    self.labelUpdateInterval.text = [TextProvider updateInterval];
    self.labelDisplayInterval.text = [TextProvider displayInterval];
    self.labelSource.text = [TextProvider displaySource];

    [self fillUI];
    
}

- (void)fillDesign {
    [super fillDesign];
    [ThemeManager.shared.theme textFieldDayInput:self.textFieldUpdateInterval];
    [ThemeManager.shared.theme textFieldDayInput:self.textFieldDisplayInterval];
}


#pragma mark - private

- (void) fillUI {
    
    self.settings = [SettingsInteractor settings];
    self.arrSources = [NewsInteractor allSources];
    
    self.textFieldUpdateInterval.text = self.settings.updateInterval;
    self.textFieldDisplayInterval.text = self.settings.displayInterval;
    
    self.selectedSource = [NewsInteractor currentSource];
    
    [self.buttonSource setTitle:self.selectedSource.title forState:UIControlStateNormal];
    
}


#pragma mark - handlers

- (void) hideKeyboard {
    [self.textFieldDisplayInterval resignFirstResponder];
    [self.textFieldUpdateInterval resignFirstResponder];
}

- (void) saveSettings {
    self.settings.updateInterval = self.textFieldUpdateInterval.text;
    self.settings.displayInterval = self.textFieldDisplayInterval.text;
    self.settings.source = self.selectedSource.uuid;
    
    [SettingsInteractor saveSettings:self.settings];
    [self closeVC];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:[TextProvider empty]]) {
        textField.text = @"1";
    }
}

@end
