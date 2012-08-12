//
//  SBEmployeeViewController.h
//  storyB_Table
//
//  Created by Ferke Zoltán on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBEmployee.h"

@interface SBEmployeeViewController : UIViewController
{
    
}

@property (nonatomic, strong) IBOutlet UIImageView* Portrait;
@property (nonatomic, strong) IBOutlet UILabel* NameLabel;
@property (nonatomic, strong) IBOutlet UILabel* PostLabel;

@property (nonatomic, strong) SBEmployee* _Employee;

@end
