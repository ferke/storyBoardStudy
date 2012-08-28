//
//  FZViewController.h
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZViewController : UIViewController <UITextFieldDelegate>
{

    UITextField* _ActiveTextField;
    UITableViewCell* _ActiveCell;
    
    NSString* _SelectedType;
    NSString* _SelectedUnit;
    
    NSArray* _Types;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl* TypeSelector;
@property (nonatomic, strong) IBOutlet UITableView* UnitSelector;

-(IBAction)onTypeSelectorSelected;
-(IBAction)onTextFieldEditBegun:(id)sender;

@end
