//
//  FZUnit.m
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import "FZUnit.h"
#import "FZOperation.h"

@implementation FZUnit

@synthesize Name, Value, Operations, IsBaseUnit;

-(FZUnit*)initWithUnitName:(NSString*)name valueOrZero:(double)value operationsOrNil:(NSArray*)operations
{
    self = [super init];
    if (self)
    {
        Name = name;
        Value = value;
        
        if (nil == operations)
        {
            Operations = [NSArray arrayWithObjects:[[FZOperation alloc] initWithOperationType:multiplication value:1], nil];
            IsBaseUnit = true;
        }
        else
        {
            Operations = operations;
            IsBaseUnit = false;
        }
    }
    return self;
}


@end
