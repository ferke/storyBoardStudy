//
//  FZViewController.m
//  base64decoder
//
//  Created by Zoltan Ferke on 8/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZViewController.h"
#import "NSData+Base64.h"

@interface FZViewController ()

@end

@implementation FZViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString* base64String = @"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}";
    NSData* decodedData = [NSData dataWithBase64EncodedString:base64String];
    
    NSUInteger length = [decodedData length];
    NSUInteger chunkSize = 8;
    NSUInteger offset = 0;
    
    int counter = 0;
    do {
        NSUInteger thisChunkSize = length - offset > chunkSize ? chunkSize : length - offset;
        NSData* chunk = [NSData dataWithBytesNoCopy:(char *)[decodedData bytes] + offset
                                             length:thisChunkSize
                                       freeWhenDone:NO];
        
        
        offset += thisChunkSize;
        
        double myDouble = [self ConvertNSDataToDouble:chunk];
        NSLog(@"%f", myDouble);
        counter++;
        
    } while (offset < length);
    
    NSLog(@"%d", counter);
}

-(double) ConvertNSDataToDouble:(NSData *)data
{
    double d;
    assert([data length] == sizeof(d));
    memcpy(&d, [data bytes], sizeof(d));
    return d;
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

@end
