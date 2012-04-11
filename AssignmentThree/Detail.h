//
//  Detail.h
//  AssignmentThree
//
//  Created by Nicholas Cipollina on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Detail : NSObject
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *textToDisplay;

- (id)initWithText:(NSString *)textToDisplay description:(NSString *)description;
@end
