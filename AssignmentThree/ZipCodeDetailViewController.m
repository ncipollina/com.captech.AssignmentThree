//
//  ZipCodeDetailViewController.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZipCodeDetailViewController.h"
#import "ZipSearch.h"

@interface ZipCodeDetailViewController ()
- (void)setDisplayData;
@end

@implementation ZipCodeDetailViewController
@synthesize zipData = _zipData;
@synthesize propertiesToShow = _propertiesToShow;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setDisplayData];
    
    [self.tableView reloadData];
}

- (void)setDisplayData{
    self.propertiesToShow = [[NSMutableArray alloc] init];
    NSString *cityStateString = [NSString stringWithFormat:@"%@, %@",[self.zipData.city copy], [self.zipData.state copy]];
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];    
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:4];
    NSNumberFormatter *integerFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [integerFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [integerFormatter setMaximumFractionDigits:0];
    NSString *latString = [numberFormatter stringFromNumber:[self.zipData.latitude copy]];
    NSString *longString = [numberFormatter stringFromNumber:[self.zipData.longitude copy]];
    NSString *latLongString = [NSString stringWithFormat:@"%@ %@",latString,longString];
    NSString *populationString = [integerFormatter stringFromNumber:[self.zipData.population copy]];
    NSString *housingUnitsString = [integerFormatter stringFromNumber:[self.zipData.housingUnits copy]];
    NSString *incomeString = [integerFormatter stringFromNumber:[self.zipData.income copy]];
    NSString *landAreaString = [numberFormatter stringFromNumber:[self.zipData.landArea copy]];
    NSString *waterAreaString = [numberFormatter stringFromNumber:[self.zipData.waterArea copy]];

    
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:cityStateString,@"City, State", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.zipCode copy],@"Zip Code", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:latLongString,@"Latitude Longitude", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.county copy],@"County", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.type copy],@"Type", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.preferred copy],@"Preferred", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.worldRegion copy],@"World Regin", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.country copy],@"Country", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.locationText copy],@"Location Text", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.location copy],@"Location", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:populationString,@"Population", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:housingUnitsString,@"Housing Units", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:incomeString,@"Income", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:landAreaString,@"Land Area", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:waterAreaString,@"Water Area", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self.zipData.decommisioned copy],@"Decommisioned", nil]];
    [self.propertiesToShow addObject:[NSDictionary dictionaryWithObjectsAndKeys:[(self.zipData.militaryRestrictionCodes)?self.zipData.militaryRestrictionCodes : @"" copy],@"Military Restriction Codes", nil]];
    
}

- (void)dealloc{
    [_zipData release];
    _zipData = nil;
    [_propertiesToShow release];
    _propertiesToShow = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.propertiesToShow count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] retain];
    }
    
    NSDictionary *detail = (NSDictionary *)[self.propertiesToShow objectAtIndex:indexPath.row];
    
    //NSLog(@"Detail is %@ for index %d", detail,indexPath.row);
    
    NSString *key = [[detail allKeys] objectAtIndex:0];
    
    cell.textLabel.text = key;
    cell.detailTextLabel.text = [detail objectForKey:key];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
