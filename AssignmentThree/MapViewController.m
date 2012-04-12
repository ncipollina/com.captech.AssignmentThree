//
//  MapViewController.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import "ZipSearch.h"
#import "ZipLocation.h"

#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize zipData = _zipData;
@synthesize _mapView;
@synthesize detailController = _detailController;

- (void)setZipData:(ZipSearch *)newZipData{
    ZipSearch *oldZip = _zipData;
    _zipData = [newZipData retain];
    [oldZip release];
}

-(void)dealloc{
    [_zipData release];
    [_mapView release];
    [_detailController release];
    [super dealloc];
}

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
    
    [_mapView setDelegate:self];
}

- (void)viewDidUnload
{
    [self set_mapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated { 
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = [self.zipData.latitude doubleValue];
    zoomLocation.longitude= [self.zipData.longitude doubleValue];
    
    ZipLocation *annotation = [[[ZipLocation alloc] initWithZipCode:self.zipData.zipCode city:self.zipData.city coordinate:zoomLocation] autorelease];
    [_mapView addAnnotation:annotation];
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];                
    // 4
    [_mapView setRegion:adjustedRegion animated:YES];      
}

- (void)viewWillDisappear:(BOOL)animated{
    [_mapView removeAnnotations:_mapView.annotations];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"ZipLocation";   
    if ([annotation isKindOfClass:[ZipLocation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        //annotationView.image=[UIImage imageNamed:@"arrest.png"];//here we use a nice image instead of the default pins
        
        return annotationView;
    }
    
    return nil;    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if (self.detailController == nil)
        self.detailController = [[[ZipCodeDetailViewController alloc] initWithNibName:@"ZipCodeDetailViewController" bundle:[NSBundle mainBundle]] autorelease];
    
    [self.detailController setZipData:self.zipData];
    
    [self.navigationController pushViewController:self.detailController animated:YES];
}
@end
