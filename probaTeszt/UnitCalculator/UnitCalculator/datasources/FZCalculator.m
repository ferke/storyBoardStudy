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
    for (FZOperation* operation in modifier.Operations) {
        
        switch (operation.Type) {
            case multiplication:
                base.Value = modifier.Value / operation.Value;
                break;
                
            case addition:
                base.Value = modifier.Value - operation.Value;
                break;
                
            default:
                NSAssert(true, @"no operation type for unit operation");
                break;
        }
    }
}

+(void)calculateUnit:(FZUnit*)unit base:(FZUnit*)base
{
    for (FZOperation* operation in unit.Operations) {
        
        switch (operation.Type) {
            case multiplication:
                unit.Value = base.Value * operation.Value;
                break;
                
            case addition:
                unit.Value = base.Value + operation.Value;
                break;
                
            default:
                NSAssert(true, @"no operation type for unit operation");
                break;
        }
    }
}

@end
