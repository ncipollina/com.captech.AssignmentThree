//
//  ZipCodeDetailViewController.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZipSearch;

@interface ZipCodeDetailViewController : UITableViewController
@property (nonatomic, retain) ZipSearch *zipData;
@property (retain, nonatomic) NSMutableArray *propertiesToShow;
@end
