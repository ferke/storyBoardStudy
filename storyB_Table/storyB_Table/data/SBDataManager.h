//
//  SBDataManager.h
//  storyB_Table
//
//  Created by Ferke Zoltán on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBDataManager : NSObject
{
    NSArray* Employees;
}

+ (SBDataManager *)getInstance;
-(NSArray*)getData;

@end
