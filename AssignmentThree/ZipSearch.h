//
//  ZipSearch.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ZipSearch : NSManagedObject

@property (nonatomic, retain) NSString * militaryRestrictionCodes;
@property (nonatomic, retain) NSString * decommisioned;
@property (nonatomic, retain) NSDecimalNumber * waterArea;
@property (nonatomic, retain) NSDecimalNumber * landArea;
@property (nonatomic, retain) NSNumber * income;
@property (nonatomic, retain) NSNumber * housingUnits;
@property (nonatomic, retain) NSNumber * population;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * locationText;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * worldRegion;
@property (nonatomic, retain) NSString * preferred;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * county;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSDecimalNumber * longitude;
@property (nonatomic, retain) NSDecimalNumber * latitude;
@property (nonatomic, retain) NSString * zipCode;

@end
