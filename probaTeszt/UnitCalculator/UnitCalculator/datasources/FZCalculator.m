//
//  FZCalculator.m
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import "FZCalculator.h"
#import "FZOperation.h"

@implementation FZCalculator

+(void)calculateUnits:(NSArray*)units fromIndex:(int)index
{
    FZUnit* baseUnit;
    
    for (FZUnit* unit in units)
    {
        if (unit.IsBaseUnit)
        {
            baseUnit = unit;
            FZUnit* modifierUnit = [units objectAtIndex:index];
            
            if (baseUnit != modifierUnit)
            {
                [self calculateBaseUnit:baseUnit modifier:modifierUnit];
            }
        }
    }
    
    for (FZUnit* unit in units)
    {
        if (!unit.IsBaseUnit)
        {
            FZUnit* editedUnit = [units objectAtIndex:index];
            
            if (unit != editedUnit)
            {
                [self calculateUnit:unit base:baseUnit];
            }
        }
    }
}

+(void)calculateBaseUnit:(FZUnit*)base modifier:(FZUnit*)modifier
{
    double temp= modifier.Value;
    
    for (int i=modifier.Operations.count-1; i < modifier.Operations.count; i--)
    {
        FZOperation* operation = [modifier.Operations objectAtIndex:i];
        
        switch (operation.Type) {
            case multiplication:
                temp = temp / operation.Value;
                break;
                
            case addition:
                temp = temp - operation.Value;
                break;
                
            default:
                NSAssert(true, @"no operation type for unit operation");
                break;
        }
    }
    
    base.Value = temp;
}

+(void)calculateUnit:(FZUnit*)unit base:(FZUnit*)base
{
    double temp= base.Value;
    
    for (FZOperation* operation in unit.Operations) {
        
        
        
        switch (operation.Type) {
            case multiplication:
                temp = temp * operation.Value;
                break;
                
            case addition:
                temp = temp + operation.Value;
                break;
                
            default:
                NSAssert(true, @"no operation type for unit operation");
                break;
        }
    }
    
    unit.Value = temp;
}

@end
