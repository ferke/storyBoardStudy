//
//  FZViewController.m
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"
#import "FZDataManager.h"

@interface FZViewController ()

@end

@implementation FZViewController
@synthesize TypeSelector, UnitSelector;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark TableView datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    _Types = [[FZDataManager getInstance] getUnitsForType:TypeSelector.selectedSegmentIndex];
    
    return _Types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"unitCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    UILabel* label = (UILabel*)[cell viewWithTag:100];
    label.text = [_Types objectAtIndex:indexPath.row];
    
    UIView* cellBackground = [[UIView alloc] init];
    [cellBackground setBackgroundColor:[UIColor clearColor]];
    [cell setBackgroundView: cellBackground];
    
    UITextField* textField = (UITextField*)[cell viewWithTag:101];
    [textField setReturnKeyType: UIReturnKeyDone];
    
    return cell;
}

#pragma mark TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(IBAction)onTypeSelectorSelected
{
    [UnitSelector reloadData];
}


@end
