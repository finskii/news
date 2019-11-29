//
//  BaseVC.m
//  news
//
//  Created by Vasilii Dmitriev on 24.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "BaseVC.h"

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillDesign];
}

- (void) fillDesign {
    
}

- (void) closeVC {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) showAlertWithTitle:(NSString*)title message:(NSString*)message {
    //callback omited due to unneeded :) 
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:[TextProvider ok] style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
