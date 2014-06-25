//
//  MALinkedInJobsSearchFacets.h
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"

@interface MALinkedInJobsSearchFacets : NSObject

@property (nonatomic, retain) NSString *facet_company;
@property (nonatomic, retain) NSString *facet_date_posted;
@property (nonatomic, retain) NSString *facet_location;
@property (nonatomic, retain) NSString *facet_job_function;
@property (nonatomic) MALinkedInIndustry facet_industry;
@property (nonatomic, retain) NSString *facet_salary;

@end
