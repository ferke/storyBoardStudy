//
//  SBEmployeeViewController.m
//  storyB_Table
//
//  Created by Ferke Zoltán on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBEmployeeViewController.h"

@interface SBEmployeeViewController ()

@end

@implementation SBEmployeeViewController
@synthesize NameLabel, Portrait, PostLabel, _Employee;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString* postString = [NSString string];
    
    switch (_Employee.Post)
    {
        case CFO:
            postString = @"Pénzügyi igazgató";
            break;
            
        case CEO:
            postString = @"Vezérigazgató";
            break;
            
        case Employee:
            postString = @"Alkalmazott";
            break;
            
        default:
            break;
    }
    
    NameLabel.text = _Employee.Name;
    PostLabel.text = postString;
    [Portrait setImage: _Employee.Portrait];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
