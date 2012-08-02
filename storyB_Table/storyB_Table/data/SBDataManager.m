//
//  SBDataManager.m
//  storyB_Table
//
//  Created by Ferke Zoltán on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBDataManager.h"
#import "SBEmployee.h"

@implementation SBDataManager

+ (SBDataManager *)getInstance
{
    static SBDataManager *gInstance = NULL;
    
    @synchronized(self)
    {
        if (gInstance == NULL)
            gInstance = [[self alloc] init];
    }
    
    return(gInstance);
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSMutableArray* data = [[NSMutableArray alloc] init];
        
        SBEmployee* emp1 = [[SBEmployee alloc] initWithName:@"Gipsz Jakab" post:CEO portrait:[UIImage imageNamed:@"portrait1.jpeg"]];
        SBEmployee* emp2 = [[SBEmployee alloc] initWithName:@"Gipsz Jozsef" post:CFO portrait:[UIImage imageNamed:@"portrait2.jpeg"]];
        SBEmployee* emp3 = [[SBEmployee alloc] initWithName:@"takarito erno" post:Employee portrait:[UIImage imageNamed:@"portrait3.jpeg"]];
        
        
        [data addObject:emp1];
        [data addObject:emp2];
        [data addObject:emp3];
        
        Employees = [NSArray arrayWithArray:data];
    }
    return self;
}

-(NSArray*)getData
{
    return Employees;
}

@end
