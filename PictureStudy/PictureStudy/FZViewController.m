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
@synthesize Picture, URLLabel;

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PictureURLString = @"https://encrypted-tbn2.google.com/images?q=tbn:ANd9GcQ9KZVj3BkKgZJCGLo8LV1U7GnEHfWct9Pz_jwk_SpP5xIPcQjntA";
    NSURL* pictureURL = [NSURL URLWithString:PictureURLString];
    
    NSData* pictureData = [NSData dataWithContentsOfURL:pictureURL];
    
    [Picture setImage:[UIImage imageWithData:pictureData]];
    URLLabel.text = PictureURLString;
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
