//
//  CreatureViewController.h
//  MCMS
//
//  Created by Aaron Dufall on 18/03/2014.
//  Copyright (c) 2014 Aaron Dufall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MagicalCreature;

@interface CreatureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) MagicalCreature *creature;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
