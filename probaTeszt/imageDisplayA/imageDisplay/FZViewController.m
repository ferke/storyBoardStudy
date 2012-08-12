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

@synthesize URLLabel, Picture;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _PictureURLstring = @"http://www.waleoyediran.com/wp-content/uploads/2011/04/stackoverflow.png";
    NSURL* pictureURL = [NSURL URLWithString:_PictureURLstring];
    NSData* pictureData = [NSData dataWithContentsOfURL:pictureURL];
    
    [Picture setImage:[UIImage imageWithData:pictureData]];
    URLLabel.text = _PictureURLstring;
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

@end
