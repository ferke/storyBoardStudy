//
//  FZTypeDataSource.m
//  UnitCalculator
//
//  Created by Ferke Zoltán on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZTypeDataSource.h"

@implementation FZTypeDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellID = @"typeCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellID];

    [[cell textLabel] setText:[NSString stringWithFormat:@"%d", indexPath.row]];
    
    return cell;
}

@end
