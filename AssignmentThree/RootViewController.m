//
//  RootViewController.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "SearchResultsViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize searchText;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize searchButton;
@synthesize searchController = _searchController;
@synthesize searchResults = _searchResults;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSearchText:nil];
    [self setSearchButton:nil];
    [self setSearchController:nil];
    [self setSearchResults:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.searchText){
        [textField resignFirstResponder];
    }
    
    return YES;
}
- (void)dealloc {
    [searchText release];
    [_managedObjectContext release];
    [searchButton release];
    [_searchController release];
    [_searchResults release];
    [super dealloc];
}
- (IBAction)doSearch:(id)sender {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ZipSearch" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
        
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"zipCode" ascending:YES] autorelease];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSPredicate *predicate = [[NSPredicate predicateWithFormat:@"zipCode BEGINSWITH[c] %@",self.searchText.text] autorelease];
    
    [fetchRequest setPredicate:predicate];
    NSError *error = nil;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchResults == nil){
        // Handle the error
    }
    
    [self setSearchResults:fetchResults];
    
    if (self.searchController == nil)
        self.searchController = [[[SearchResultsViewController alloc] initWithNibName:@"SearchResultsViewController" bundle:[NSBundle mainBundle]] autorelease];
    
    [self.searchController setSearchResults:self.searchResults];
    
    [self.navigationController pushViewController:self.searchController animated:YES];
}

@end
