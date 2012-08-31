//
//  FZOperation.m
//  UnitCalculator
//
//  Created by Zoltan Ferke on 8/31/12.
//
//

#import "FZOperation.h"

@implementation FZOperation

@synthesize Type, Value;

- (id)initWithOperationType:(OperationType)type value:(double)value
{
    self = [super init];
    if (self) {
        Type = type;
        Value = value;
    }
    return self;
}

@end
