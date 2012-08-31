//
//  FZCalculator.h
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import <Foundation/Foundation.h>
#import "FZUnit.h"

@interface FZCalculator : NSObject

+(void)calculateUnits:(NSArray*)units fromIndex:(int)index;
+(void)calculateBaseUnit:(FZUnit*)base modifier:(FZUnit*)modifier;
+(void)calculateUnit:(FZUnit*)unit base:(FZUnit*)base;

@end
