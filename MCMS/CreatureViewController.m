//
//  CreatureViewController.m
//  MCMS
//
//  Created by Aaron Dufall on 18/03/2014.
//  Copyright (c) 2014 Aaron Dufall. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"


@interface CreatureViewController ()<UITextFieldDelegate>

@end

@implementation CreatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.name.text = self.creature.name;
    
    if (self.creature.name.length == 0) {
        self.name.text = @"Unknown";
        self.nameTextField.text = @"Unknown";

    }
    
    
	// Do any additional setup after loading the view.
}

- (IBAction)onEditButtonPressed:(id)sender {
    self.nameTextField.text = self.creature.name;
    self.nameTextField.alpha = 1;
    [self.nameTextField becomeFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.creature.name = textField.text;
//    self.name = textField.text;
    return YES;
}

- (IBAction)onSaveButtonPressed:(id)sender {
    self.creature.name = self.nameTextField.text;
    [self.view endEditing:YES];
}




@end
