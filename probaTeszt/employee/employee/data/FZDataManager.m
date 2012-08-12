//
//  FZDataManager.m
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZDataManager.h"
#import "FZEmployee.h"

@implementation FZDataManager

static FZDataManager *instance = NULL;

+ (FZDataManager*)getInstance
{
    @synchronized(self)
    {
        if (instance == NULL)
            instance = [[self alloc] init];
        
        
    }
    
    return(instance);
}

- (id)init
{
    self = [super init];
    if (self)
    {
        FZEmployee* emp1 = [[FZEmployee alloc] initWithEmployeeName:@"egyeske" post:@"vezerig" portrait:[UIImage imageNamed:@"emp1.jpeg"]];
        FZEmployee* emp2 = [[FZEmployee alloc] initWithEmployeeName:@"ketteske" post:@"csoportvez" portrait:[UIImage imageNamed:@"emp2.jpeg"]];
        FZEmployee* emp3 = [[FZEmployee alloc] initWithEmployeeName:@"harmaska" post:@"takarito" portrait:[UIImage imageNamed:@"emp3.jpeg"]];
        
        _Employees = [[NSArray alloc] initWithObjects:emp1, emp2, emp3, nil];
    }
    return self;
}

-(NSArray*)getEmployees
{
    return _Employees;
}

@end
