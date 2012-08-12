//
//  FZEmployee.m
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZEmployee.h"

@implementation FZEmployee

@synthesize Name, Post, Portrait;

- (id)initWithEmployeeName:(NSString*)name post:(NSString*)post portrait:(UIImage*)portrait
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
