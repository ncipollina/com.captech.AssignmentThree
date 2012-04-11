//
//  ZipLocation.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class ZipSearch;

@interface ZipLocation : NSObject <MKAnnotation>{
    NSString *_city;
    NSString *_zipCode;
    CLLocationCoordinate2D _coordinate;
}

@property (retain, nonatomic) NSString *city;
@property (retain, nonatomic) NSString *zipCode;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithZipCode:(NSString *)zipCode city:(NSString *)city coordinate:(CLLocationCoordinate2D)cooridnate;
@end
