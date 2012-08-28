//
//  FZDataManager.h
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    weight,
    length,
    temperature,
    volume,
    
}Types;

@interface FZDataManager : NSObject

+(FZDataManager*)getInstance;

-(NSArray*)getUnitsForType:(Types)type;

@end
