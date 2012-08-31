//
//  FZOperation.h
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import <Foundation/Foundation.h>

typedef enum
{
    addition,
    subtraction,
    multiplication,
    division
}OperationType;

@interface FZOperation : NSObject

@property (assign) OperationType Type;
@property (assign) double Value;

- (id)initWithOperationType:(OperationType)type value:(double)value;

@end
