//
//  A3MasterViewController.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class A3DetailViewController;

#import <CoreData/CoreData.h>

@interface A3MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) A3DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
