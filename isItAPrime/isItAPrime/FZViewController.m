//
//  FZViewController.m
//  isItAPrime
//
//  Created by Zoltan Ferke on 9/3/12.
//  Copyright (c) 2012 Zoltan Ferke. All rights reserved.
//

#import "FZViewController.h"

@interface FZViewController ()

@end

@implementation FZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (int i=0; i < 100; i++)
    {
        if ([self isPrime:i]) {
             NSLog(@"%d is prime", i);
        }
       
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(BOOL)isPrime:(int)number
{
    if (number < 2)
    {
        return FALSE;
    }
    
    for (int i=2; i <= sqrt(number) ; i++)
    {
        if(number%i == 0)
        {
            return FALSE;
        }
    }
    
    return TRUE;
}
@end
