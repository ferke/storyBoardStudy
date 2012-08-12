//
//  FZViewController.h
//  imageDisplay
//
//  Created by Ferke Zoltán on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZViewController : UIViewController

{
    NSString* _PictureURLstring;
}

@property (nonatomic, strong) IBOutlet UIImageView* Picture;
@property (nonatomic, strong) IBOutlet UILabel* URLLabel;

@end
