//
//  ViewController.m
//  MCMS
//
//  Created by Aaron Dufall on 18/03/2014.
//  Copyright (c) 2014 Aaron Dufall. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *magicalCreatureTextField;


@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MagicalCreature *dragon = [[MagicalCreature alloc]init];
    dragon.name = @"Dragon";
    dragon.description = @"Scally Beast";
    
    MagicalCreature *wombat = [[MagicalCreature alloc]init];
    wombat.name = @"Wombat";
    wombat.description = @"Furry Beast";
    
    
    MagicalCreature *timmy = [[MagicalCreature alloc]init];
    timmy.name = @"Timmy";
    timmy.description = @"Idiot Beast";
    
    
    self.creatures = [NSMutableArray arrayWithObjects:dragon,wombat,timmy, nil];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.myTableView reloadData];
}
- (IBAction)onAddButtonPressed:(id)sender {
    MagicalCreature *newCreature = [[MagicalCreature alloc]init];
    newCreature.name = self.magicalCreatureTextField.text;
    [self.creatures addObject:newCreature];
    [self.myTableView reloadData];
    [self.view endEditing:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
    CreatureViewController *vc = [segue destinationViewController];
    vc.creature = [self.creatures objectAtIndex:indexPath.row];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.creatures count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"MagicalCreatureID"];
    cell.textLabel.text = creature.name;
    return cell;
}

@end
