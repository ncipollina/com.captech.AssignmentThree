//
//  Detail.m
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Detail.h"

@implementation Detail
@synthesize description = _description;
@synthesize textToDisplay = _textToDisplay;

- (id)initWithText:(NSString *)textToDisplay description:(NSString *)description{
    if (self = [super init]){
        _description = description;
        _textToDisplay = textToDisplay;
    }
    return self;
}

- (void)dealloc{
    [_description release];
    [_textToDisplay release];
    [super dealloc];
}
@end
