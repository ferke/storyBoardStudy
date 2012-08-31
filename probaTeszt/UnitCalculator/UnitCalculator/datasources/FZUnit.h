//
//  FZUnit.h
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import <Foundation/Foundation.h>

@interface FZUnit : NSObject

@property (nonatomic, strong) NSString* Name;
@property (assign) double Value;
@property (nonatomic, strong) NSArray* Operations;
@property (assign) BOOL IsBaseUnit;

-(FZUnit*)initWithUnitName:(NSString*)name valueOrZero:(double)value operationsOrNil:(NSArray*)operations;

@end
