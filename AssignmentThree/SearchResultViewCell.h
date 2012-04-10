//
//  SearchResultViewCell.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZipSearch;

@interface SearchResultViewCell : UITableViewCell

@property (strong, nonatomic) ZipSearch *searchData;
@property (retain, nonatomic) IBOutlet UILabel *zipCodeLabel;

@property (retain, nonatomic) IBOutlet UILabel *locationLabel;
@end
