//
//  SearchResultViewCell.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchResultViewCell.h"
#import "ZipSearch.h"

@implementation SearchResultViewCell
@synthesize searchData = _searchData;
- (void)dealloc {
    [_zipCodeLabel release];
    [_locationLabel release];
    [_searchData release];
    [super dealloc];
}
@synthesize zipCodeLabel = _zipCodeLabel;
@synthesize locationLabel = _locationLabel;

- (void)setSearchData:(ZipSearch *)newSearchData{
    [newSearchData retain];
    [_searchData release];
    _searchData = newSearchData;
    
    self.zipCodeLabel.text = _searchData.zipCode;
    self.locationLabel.text = [NSString stringWithFormat: @"%@, %@ %@", _searchData.city, _searchData.state, _searchData.zipCode];
}
@end
