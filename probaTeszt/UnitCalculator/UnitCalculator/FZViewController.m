//
//  FZViewController.m
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"
#import "FZDataManager.h"
#import "FZUnit.h"
#import "FZCalculator.h"

@interface FZViewController ()

@end

static int CELL_HEIGHT = 44; //pixel
static int TEXTFIELD_BOTTOM_MARGIN = 2; //pixel

@implementation FZViewController
@synthesize TypeSelector, UnitSelector;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    _Units = [[FZDataManager getInstance] getUnitsForType:TypeSelector.selectedSegmentIndex];
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

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.view endEditing:YES];
}

#pragma mark TableView datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return _Units.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"unitCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    UILabel* label = (UILabel*)[cell viewWithTag:100];
    label.text = [[_Units objectAtIndex:indexPath.row] Name];
    
    UIView* cellBackground = [[UIView alloc] init];
    //[cellBackground setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    [cell setBackgroundView: cellBackground];
    
    //change the keyboard type
    UITextField* textField = (UITextField*)[cell viewWithTag:101];
    [textField setTag:(200+indexPath.row)];
    [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    
    FZUnit* unit = [_Units objectAtIndex:indexPath.row];
    NSLog(@"%d", indexPath.row);
    NSLog(@"%@", [NSString stringWithFormat: @"%f", unit.Value]);
    NSString* string = [NSString stringWithFormat: @"%.02f", unit.Value];
    NSLog(@"%@", string);
    textField.text = string; //[NSString stringWithFormat: @"%f", [[_Units objectAtIndex:indexPath.row] Value]];

    textField.text = [NSString stringWithFormat: @"%.02f %.02f", (float)indexPath.row/100, unit.Value];
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

-(IBAction)onTextFieldEditBegun:(id)sender;
{
    _CurrentUnit = [sender tag] - 200;
}

-(IBAction)onTypeSelectorSelected
{
    [UnitSelector reloadData];
}

-(IBAction)onInvisiblRowButtonPressed
{
    [self.view endEditing:YES];
    [self calculate];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    //on touching BG of view
    
    //hide keyboard 
    [self.view endEditing:YES];
    [self calculate];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //on pressing return (done) on keyboard
    
    //hide keyboard
    [textField resignFirstResponder];
    [self calculate];
    
    return YES;
}

-(void)calculate
{
    //refresh current unit
    [(FZUnit*)[_Units objectAtIndex:_CurrentUnit] setValue:[[(UITextField*)[self.view viewWithTag:200+_CurrentUnit] text] doubleValue]];
    
    for (FZUnit* unit in _Units)
    {
        NSLog(@"elotte %f", unit.Value);
    }

    [FZCalculator calculateUnits:_Units fromIndex:_CurrentUnit];
    
    for (FZUnit* unit in _Units)
    {
        NSLog(@"utana %f", unit.Value);
    }
    
    [UnitSelector reloadData];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _ActiveTextField = textField;
    _ActiveCell = (UITableViewCell*)textField.superview;
    
    if (_IsKeyboardUp)
    {
        [self moveTableContentAboveKeyboard];   
    }
}

#pragma mark keyboard show hide methods

- (void)keyboardWasShown:(NSNotification*)aNotification
{

    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //NSLog(@"kb size %@",NSStringFromCGSize(kbSize));
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    UnitSelector.contentInset = contentInsets;
    UnitSelector.scrollIndicatorInsets = contentInsets;
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //NSLog(@"screen rect%@",NSStringFromCGRect(screen));
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)
    {
        _KeyboardRect = CGRectMake(screen.origin.x, screen.size.height - kbSize.height, screen.size.width, kbSize.height);
    }
    else
    {
        _KeyboardRect = CGRectMake(screen.origin.y, screen.size.width - kbSize.width, screen.size.height, kbSize.width);
    }
    
    _IsKeyboardUp = true;

    [self moveTableContentAboveKeyboard];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    _IsKeyboardUp = false;
    [UnitSelector setContentOffset:CGPointMake(0.0,0.0) animated:YES];

}

- (void)moveTableContentAboveKeyboard
{
    float textFieldBottomHeight = UnitSelector.frame.origin.y + _ActiveTextField.frame.origin.y +_ActiveTextField.frame.size.height;
    textFieldBottomHeight += CELL_HEIGHT*(_ActiveTextField.tag-200);
    
    int statusbarHeight = [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ?
        [[UIApplication sharedApplication] statusBarFrame].size.height :
        [[UIApplication sharedApplication] statusBarFrame].size.width;
    
    textFieldBottomHeight += statusbarHeight;
    textFieldBottomHeight += TEXTFIELD_BOTTOM_MARGIN;
    
    float textFieldLeftWidth = UnitSelector.frame.origin.x+ _ActiveTextField.frame.origin.x;
    
    CGPoint textFieldBottomLeftPoint = CGPointMake(textFieldLeftWidth, textFieldBottomHeight);
    
    //NSLog(@"arect %@", NSStringFromCGRect(_KeyboardRect));
    //NSLog(@"point %@", NSStringFromCGPoint(textFieldBottomLeftPoint));
    
    if (CGRectContainsPoint(_KeyboardRect, textFieldBottomLeftPoint) ) {
        CGPoint scrollPoint = CGPointMake(0.0, textFieldBottomLeftPoint.y-_KeyboardRect.origin.y);
        [UnitSelector setContentOffset:scrollPoint animated:YES];
    }
    else
    {
        [UnitSelector setContentOffset:CGPointMake(0.0,0.0) animated:YES];
    }
}

@end
