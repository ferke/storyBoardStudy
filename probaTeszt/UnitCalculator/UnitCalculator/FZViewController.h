//
//  FZViewController.h
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZViewController : UIViewController <UITableViewDelegate>

{
    UITableView* _TypeSelector;
    NSString* _SelectedType;
    
    UITableView* _UnitSelector;
    NSString* _SelectedUnit;
}

@end
