//
//  FZViewController.m
//  PictureStudy
//
//  Created by Ferke Zoltán on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"

@interface FZViewController ()

@end

@implementation FZViewController
@synthesize Picture, URLLabel, URLField;

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

- (IBAction)onDisplayPicturePressed
{
    [self.view endEditing:YES];
    
    PictureURLString = URLField.text;
    
    NSURL* pictureURL = [NSURL URLWithString:PictureURLString];
    
    NSData* pictureData = [NSData dataWithContentsOfURL:pictureURL];
    
    [Picture setImage:[UIImage imageWithData:pictureData]];
    URLLabel.text = PictureURLString;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [self.view endEditing:YES];
}  

@end
