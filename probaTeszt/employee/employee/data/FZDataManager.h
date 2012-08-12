//
//  FZDataManager.h
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FZDataManager : NSObject
{
    NSArray* _Employees;
}

-(NSArray*)getEmployees;
+(FZDataManager*) getInstance;

@end
