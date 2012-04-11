//
//  ZipCodeDetailViewController.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZipCodeDetailViewController.h"
#import "ZipSearch.h"
#import "Detail.h"

@interface ZipCodeDetailViewController ()
- (void)setDisplayData;
@end

@implementation ZipCodeDetailViewController
@synthesize zipData = _zipData;
@synthesize propertiesToShow = _propertiesToShow;

- (void)setZipData:(ZipSearch *)newZipData{
    ZipSearch *oldZip = _zipData;
    _zipData = [newZipData retain];
    [oldZip release];
}

- (void)setPropertiesToShow:(NSMutableArray *)newPropertiesToShow{
    if (_propertiesToShow != newPropertiesToShow)
        _propertiesToShow = newPropertiesToShow;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setDisplayData];
    
    [self.tableView reloadData];
}

- (void)setDisplayData{
    self.propertiesToShow = [[[NSMutableArray alloc] init]retain];
    NSString *cityStateString = [[NSString stringWithFormat:@"%@, %@",self.zipData.city, self.zipData.state]retain];
    Detail *cityDetail = [[[Detail alloc] initWithText:cityStateString description:@"City, State"]retain];
    [self.propertiesToShow addObject:cityDetail];
    Detail *zipDetail = [[[Detail alloc] initWithText:self.zipData.zipCode description:@"Zip Code"]retain];
    [self.propertiesToShow addObject:zipDetail];
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];    
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:4];
    NSNumberFormatter *integerFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [integerFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [integerFormatter setMaximumFractionDigits:0];
    NSString *latString = [[numberFormatter stringFromNumber:self.zipData.latitude]retain];
    NSString *longString = [[numberFormatter stringFromNumber:self.zipData.longitude]retain];
    NSString *latLongString = [[NSString stringWithFormat:@"%@ %@",latString,longString]retain];
    Detail *latLongDetail =[[[Detail alloc] initWithText:latLongString description:@"Lattitude Longitude"]retain];
    [self.propertiesToShow addObject:latLongDetail];
    Detail *countyDetail = [[[Detail alloc] initWithText:self.zipData.county description:@"County"]retain];
    [self.propertiesToShow addObject:countyDetail];
    
    Detail *typeDetail =[[[Detail alloc] initWithText:self.zipData.type description:@"Type"]retain];
    [self.propertiesToShow addObject:typeDetail];
    Detail *preferredDetail = [[[Detail alloc] initWithText:self.zipData.preferred description:@"Preferred"]retain];
    [self.propertiesToShow addObject:preferredDetail];
    Detail *worldRegionDetail = [[[Detail alloc] initWithText:self.zipData.worldRegion description:@"World Region"]retain];
    [self.propertiesToShow addObject:worldRegionDetail];
    Detail *countryDetail =[[[Detail alloc] initWithText:self.zipData.country description:@"Country"]retain];
    [self.propertiesToShow addObject:countryDetail];
    Detail *locationTextDetail =[[[Detail alloc] initWithText:self.zipData.locationText description:@"LocationText"]retain];
    [self.propertiesToShow addObject:locationTextDetail];
    Detail *locatinDetail = [[[Detail alloc] initWithText:self.zipData.location description:@"Location"]retain];
    [self.propertiesToShow addObject:locatinDetail];
    NSString *populationString = [[integerFormatter stringFromNumber:self.zipData.population]retain];
    Detail *populationDetail = [[[Detail alloc] initWithText:populationString description:@"Population"]retain];
    NSString *housingUnitsString = [[integerFormatter stringFromNumber:self.zipData.housingUnits]retain];
    [self.propertiesToShow addObject:populationDetail];
    Detail *housingUnitsDetail = [[[Detail alloc] initWithText:housingUnitsString description:@"Housing Units"]retain];
    [self.propertiesToShow addObject:housingUnitsDetail];
    NSString *incomeString = [[integerFormatter stringFromNumber:self.zipData.income]retain];
    Detail *incomeDetail =[[[Detail alloc] initWithText:incomeString description:@"Income"]retain];
    [self.propertiesToShow addObject:incomeDetail];
    NSString *landAreaString = [[numberFormatter stringFromNumber:self.zipData.landArea]retain];
    Detail *landAreaDetail = [[[Detail alloc] initWithText:landAreaString description:@"Land Area"]retain];
    [self.propertiesToShow addObject:landAreaDetail];
    NSString *waterAreaString = [[numberFormatter stringFromNumber:self.zipData.waterArea]retain];
    Detail *waterAreaDetail = [[[Detail alloc] initWithText:waterAreaString description:@"Water Area"]retain];
    [self.propertiesToShow addObject:waterAreaDetail];
    Detail *decommisionedDetail = [[[Detail alloc] initWithText:self.zipData.decommisioned description:@"Decommisioned"]retain];
    [self.propertiesToShow addObject:decommisionedDetail];
    Detail *militaryDetail = [[[Detail alloc] initWithText:self.zipData.militaryRestrictionCodes description:@"Military Restriction Codes"]retain];
    [self.propertiesToShow addObject:militaryDetail];
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
    Detail *detail = (Detail *)[self.propertiesToShow objectAtIndex:indexPath.row];
    
    cell.textLabel.text = detail.description;
    cell.detailTextLabel.text = detail.textToDisplay;
    
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
