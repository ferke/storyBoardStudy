//
//  FZViewController.m
//  textFieldA
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"

@interface FZViewController ()

@end

@implementation FZViewController

@synthesize inputField, outputLabel;

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

#pragma mark events

-(IBAction)onDisplayButtonPressed;
{
    [self.view endEditing:YES];
    outputLabel.text = inputField.text;
}

-(IBAction)onRefreshLabel;
{
    outputLabel.text = inputField.text;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
