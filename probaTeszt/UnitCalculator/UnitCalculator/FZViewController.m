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
    
    //change the keyboard type
    UITextField* textField = (UITextField*)[cell viewWithTag:101];
    [textField setTag:(200+indexPath.row)];
    [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    
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

-(IBAction)onInvisiblRowButtonPressed
{
    [self.view endEditing:YES];
}

#warning obsolete
-(IBAction)onTextFieldEditBegun:(id)sender
{
    //_ActiveTextField = sender;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    //on touching BG of view
    
    //hide keyboard 
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //on pressing return (done) on keyboard
    
    //hide keyboard
    [textField resignFirstResponder];
    
    return YES;
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
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    UnitSelector.contentInset = contentInsets;
    UnitSelector.scrollIndicatorInsets = contentInsets;
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    _KeyboardRect = CGRectMake(screen.origin.x, screen.size.height - kbSize.height, screen.size.width, kbSize.height);
    
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
    textFieldBottomHeight += [[UIApplication sharedApplication] statusBarFrame].size.height;
    textFieldBottomHeight += TEXTFIELD_BOTTOM_MARGIN;
    
    float textFieldLeftWidth = UnitSelector.frame.origin.x+ _ActiveTextField.frame.origin.x;
    
    CGPoint textFieldBottomLeftPoint = CGPointMake(textFieldLeftWidth, textFieldBottomHeight);
    
    NSLog(@"arect %@", NSStringFromCGRect(_KeyboardRect));
    NSLog(@"point %@", NSStringFromCGPoint(textFieldBottomLeftPoint));
    
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
