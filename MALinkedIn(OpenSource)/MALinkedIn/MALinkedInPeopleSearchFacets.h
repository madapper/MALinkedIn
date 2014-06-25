//
//  MALinkedInPeopleSearchFacets.h
//  MALinkedIn
//
//  Created by Paul Napier on 16/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInPeopleSearchBucket.h"

@interface MALinkedInPeopleSearchFacets : NSObject

@property (nonatomic) bool facet_name;
@property (nonatomic) bool facet_code;
@property (nonatomic, retain) MALinkedInPeopleSearchBucket *facet_bucket;

@end
