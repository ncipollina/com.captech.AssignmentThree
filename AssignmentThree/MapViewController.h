//
//  MapViewController.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ZipCodeDetailViewController.h"

@class ZipSearch;

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (retain, nonatomic) ZipSearch *zipData;
@property (retain, nonatomic) IBOutlet MKMapView *_mapView;
@property (strong, nonatomic) ZipCodeDetailViewController *detailController;
@end
