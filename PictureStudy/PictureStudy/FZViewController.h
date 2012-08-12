//
//  FZViewController.h
//  PictureStudy
//
//  Created by Ferke Zoltán on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZViewController : UIViewController
{
    NSString* PictureURLString;
}

@property (nonatomic, strong) IBOutlet UILabel* URLLabel;
@property (nonatomic, strong) IBOutlet UIImageView* Picture;

@end
