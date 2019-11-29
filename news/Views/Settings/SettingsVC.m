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

@interface SettingsVC() <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *labelUpdateInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUpdateInterval;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDisplayInterval;
@property (weak, nonatomic) IBOutlet UILabel *labelSource;
@property (weak, nonatomic) IBOutlet UIButton *buttonSource;

@property (nonatomic, strong) Settings* settings;
@property (nonatomic, strong) NSArray<ChannelSource*>* arrSources;
@property (nonatomic, strong) ChannelSource* selectedSource;

@property (nonatomic, strong) UIPickerView* picker;
@property (nonatomic, strong) UITextField* cheatView;

@end

@implementation SettingsVC

#pragma mark - set/get

- (UIPickerView *)picker {
    if (!_picker) {
        _picker = [UIPickerView new];
    }
    return _picker;
}

#pragma mark - override

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [TextProvider navBarTitleSettingst];
    
    UIGestureRecognizer* _reco = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    [self.view addGestureRecognizer:_reco];
    
    UIBarButtonItem* _buttonSettings = [[UIBarButtonItem alloc] initWithTitle:[TextProvider save] style:UIBarButtonItemStylePlain target:self action:@selector(saveSettings)];
    self.navigationItem.rightBarButtonItem = _buttonSettings;
    
    self.cheatView = [[UITextField alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.cheatView];
    self.cheatView.inputView = self.picker;
    
    self.textFieldDisplayInterval.delegate = self;
    self.textFieldUpdateInterval.delegate = self;
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
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
    [self.cheatView resignFirstResponder];
}

- (void) saveSettings {
    [self hideKeyboard];
    [SettingsInteractor saveSettings:self.settings update:self.textFieldDisplayInterval.text
                                   display:self.textFieldUpdateInterval.text
                                    source:self.selectedSource.uuid];

    
    [SettingsInteractor saveSettings:self.settings];
    [self closeVC];
}
- (IBAction)buttonSourceHandler:(id)sender {
    if (!self.cheatView.isFirstResponder) {
        [self.cheatView becomeFirstResponder];
    } else {
        [self.cheatView resignFirstResponder];
    }
}



#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:[TextProvider empty]]) {
        textField.text = @"1";
    }
}

- (NSInteger)numberOfComponentsInPickerView:( UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.arrSources.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self.arrSources objectAtIndex:row] title];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedSource = [self.arrSources objectAtIndex:row];
    [self.buttonSource setTitle:self.selectedSource.title forState:UIControlStateNormal];
}





@end
