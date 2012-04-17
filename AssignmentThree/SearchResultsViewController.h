//
//  SearchResultsViewController.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface SearchResultsViewController : UITableViewController{
    UINib *cellLoader;
}

@property (retain, nonatomic) NSArray *searchResults;
@property (retain, nonatomic) MapViewController *mapController;

@end
