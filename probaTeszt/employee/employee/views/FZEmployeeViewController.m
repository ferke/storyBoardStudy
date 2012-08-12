//
//  FZEmployeeViewController.m
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZEmployeeViewController.h"

@interface FZEmployeeViewController ()

@end

@implementation FZEmployeeViewController

@synthesize Employee, Name, Post, Portrait;

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
	// Do any additional setup after loading the view.
    
    Name.text = Employee.Name;
    Post.text = Employee.Post;
    [Portrait setImage:Employee.Portrait];
    
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
