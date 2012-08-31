//
//  FZDataManager.m
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZDataManager.h"
#import "FZUnit.h"
#import "FZOperation.h"

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
        {
            return [NSArray arrayWithObjects:
                    [[FZUnit alloc] initWithUnitName:@"kilogram" valueOrZero:0 operationsOrNil:nil],
                    [[FZUnit alloc] initWithUnitName:@"gram" valueOrZero:0 operationsOrNil:
                        [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:1000], nil]],
                    [[FZUnit alloc] initWithUnitName:@"pound" valueOrZero:0 operationsOrNil:
                        [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:0.453592], nil]],
                    [[FZUnit alloc] initWithUnitName:@"ounce" valueOrZero:0 operationsOrNil:
                     [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:35.274], nil]],
                    nil];
        }
        
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
