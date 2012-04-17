//
//  RootViewController.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@class SearchResultsViewController;

@interface RootViewController : UIViewController <UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *searchText;
- (IBAction)doSearch:(id)sender;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (retain, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) SearchResultsViewController *searchController;
@property (retain, nonatomic) NSArray *searchResults;

@end
