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
    [self createSaveButton];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self createNewToDoItem];
    return YES;
}

- (void)createNewToDoItem {
    ToDoItem *newToDoItem = [[ToDoItem alloc] initWithContext:self.context];
    
    // If appropriate, configure the new managed object.
    newToDoItem.title = self.titleTextField.text;
    newToDoItem.toDoDescription = self.descriptionTextField.text;
    newToDoItem.priorityNumber = [self.priorityTextField.text intValue];
    newToDoItem.isCompleted = NO;
    
    // Save the context.
    NSError *error = nil;
    if (![self.context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createSaveButton {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(createNewToDoItem)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

@end
