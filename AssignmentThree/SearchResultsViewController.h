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

@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) MapViewController *mapController;

@end
