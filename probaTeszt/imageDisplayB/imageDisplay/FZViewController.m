//
//  FZViewController.m
//  imageDisplay
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"

@interface FZViewController ()

@end

@implementation FZViewController

@synthesize URLField, Picture;

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

-(IBAction)onDisplayPicturePressed
{
    [self.view endEditing:YES];
    _PictureURLstring = URLField.text;
    NSURL* pictureURL = [NSURL URLWithString:_PictureURLstring];
    NSData* pictureData = [NSData dataWithContentsOfURL:pictureURL];
    
    [Picture setImage:[UIImage imageWithData:pictureData]];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
