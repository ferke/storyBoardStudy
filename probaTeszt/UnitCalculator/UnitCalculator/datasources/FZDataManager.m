//
//  FZDataManager.m
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZDataManager.h"

@implementation FZDataManager

static FZDataManager *gInstance = NULL;

+(FZDataManager*)getInstance
{
    if(gInstance)
        return gInstance;
    
    @synchronized(self)
    {
        if (gInstance == NULL)
            gInstance = [[self alloc] init];
    }
    return gInstance;
}

-(NSArray*)getUnitsForType:(Types)type
{
    switch (type)
    {
        case weight:
            return [NSArray arrayWithObjects:@"kilogram", @"gram", @"pound", @"ounce", nil];
        
        case length:
            return [NSArray arrayWithObjects:@"kilometer", @"meter", @"centimeter", @"mile", @"feet", @"inch", nil];
        
        case temperature:
            return [NSArray arrayWithObjects:@"C", @"K", @"F", nil];

        case volume:
            return [NSArray arrayWithObjects:@"liter", @"gallon", nil];

        default:
            return [NSArray array];
    }
}

@end
