//
//  NewToDoViewController.m
//  EveryDoAgain
//
//  Created by Suvan Ramani on 2016-11-23.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "NewToDoViewController.h"

@interface NewToDoViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (strong, nonatomic) UITapGestureRecognizer *tapGR;


@end

@implementation NewToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generalSetUp];
    
}


- (void)generalSetUp {
    self.titleTextField.tag = 1;
    self.descriptionTextField.tag = 2;
    self.priorityTextField.tag = 3;
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGR];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}


@end
