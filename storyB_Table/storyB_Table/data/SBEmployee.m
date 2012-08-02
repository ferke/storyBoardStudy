//
//  SBEmployee.m
//  storyB_Table
//
//  Created by Ferke Zoltán on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBEmployee.h"

@implementation SBEmployee

@synthesize Post, Portrait, Name;

- (id)initWithName:(NSString*)name post:(SBPost)post portrait:(UIImage*)portrait
{
    self = [super init];
    if (self)
    {
        Name = name;
        Post = post;
        Portrait = portrait;
    }
    return self;    
}

@end
