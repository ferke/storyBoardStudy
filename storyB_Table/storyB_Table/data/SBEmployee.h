//
//  SBEmployee.h
//  storyB_Table
//
//  Created by Ferke Zoltán on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBEmployee : NSObject

typedef enum {
    CFO,
    CEO,
    Employee
} SBPost;

@property (nonatomic, assign) SBPost Post;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) UIImage* Portrait;

- (id)initWithName:(NSString*)name post:(SBPost)post portrait:(UIImage*)portrait;

@end
