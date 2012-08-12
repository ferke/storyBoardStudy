//
//  FZEmployeeViewController.h
//  employee
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZEmployee.h"

@interface FZEmployeeViewController : UIViewController

@property (nonatomic, strong) FZEmployee* Employee;

@property (nonatomic, strong) IBOutlet UILabel* Name;
@property (nonatomic, strong) IBOutlet UILabel* Post;
@property (nonatomic, strong) IBOutlet UIImageView* Portrait;

@end
