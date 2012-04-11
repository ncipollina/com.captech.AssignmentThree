//
//  ZipLocation.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZipLocation.h"
#import "ZipSearch.h"

@implementation ZipLocation
@synthesize coordinate = _coordinate;
@synthesize city = _city;
@synthesize zipCode = _zipCode;


- (id)initWithZipCode:(NSString *)zipCode city:city coordinate:(CLLocationCoordinate2D)cooridnate{
    if (self = [super init]){
        _zipCode = [zipCode copy];
        _city = [city copy];
        _coordinate = cooridnate;
    }
    
    return self;
}

- (NSString *)title{
    if ([self.city isKindOfClass:[NSNull class]])
        return @"Unkown city";
    else 
        return self.city;
}

- (NSString *)subtitle{
    return self.zipCode;
}

- (void)dealloc{
    [_zipCode release];
    [_city release];
    [super dealloc];
}
@end
