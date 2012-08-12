//
//  FZEmployee.h
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZEmployee : NSObject

@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* Post;
@property (nonatomic, strong) UIImage* Portrait;

- (id)initWithEmployeeName:(NSString*)name post:(NSString*)post portrait:(UIImage*)portrait;

@end
