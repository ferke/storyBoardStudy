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
            return [NSArray arrayWithObjects:
                    [[FZUnit alloc] initWithUnitName:@"kilometer" valueOrZero:0 operationsOrNil:[[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:0.001], nil]],
                    [[FZUnit alloc] initWithUnitName:@"meter" valueOrZero:0 operationsOrNil:nil],
                    [[FZUnit alloc] initWithUnitName:@"centimeter" valueOrZero:0 operationsOrNil:
                     [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:100], nil]],
                    [[FZUnit alloc] initWithUnitName:@"mile" valueOrZero:0 operationsOrNil:
                     [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:0.000621371], nil]],
                    [[FZUnit alloc] initWithUnitName:@"feet" valueOrZero:0 operationsOrNil:
                     [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:3.28084], nil]],
                    [[FZUnit alloc] initWithUnitName:@"inch" valueOrZero:0 operationsOrNil:
                     [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:39.3701], nil]],
                    nil];
        
        case temperature:
            return [NSArray arrayWithObjects:
                    [[FZUnit alloc] initWithUnitName:@"celsius" valueOrZero:0 operationsOrNil:nil],
                    [[FZUnit alloc] initWithUnitName:@"fahrenheit" valueOrZero:0 operationsOrNil:
                        [[NSArray alloc] initWithObjects:
                         [[FZOperation alloc] initWithOperationType:multiplication value:1.8],
                         [[FZOperation alloc] initWithOperationType:addition value:32],nil]],
                    [[FZUnit alloc] initWithUnitName:@"kelvin" valueOrZero:0 operationsOrNil:
                        [[NSArray alloc] initWithObjects:[[FZOperation alloc] initWithOperationType:addition value:273.15], nil]],
                    nil];

        case volume:
            return [NSArray arrayWithObjects:@"liter", @"gallon", nil];

        default:
            return [NSArray array];
    }
}

@end
