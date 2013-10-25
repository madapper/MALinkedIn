//
//  MALinkedInJobsSearchFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInJobsSearchFacets.h"
#import "MALinkedInEnums.h"



@interface MALinkedInJobsSearchParameters : NSObject

@property (nonatomic, retain) NSString *param_keywords;
@property (nonatomic, retain) NSString *param_company_name;
@property (nonatomic, retain) NSString *param_job_title;
@property (nonatomic, retain) NSString *param_country_code;
@property (nonatomic, retain) NSString *param_postal_code;
@property (nonatomic) int param_distance;
@property (nonatomic, retain) MALinkedInJobsSearchFacets *param_facets;
@property (nonatomic) int param_start;
@property (nonatomic) int param_count;
@property (nonatomic) MALinkedInJobsSearchFieldsSort param_sort;

-(NSString *)getSort:(MALinkedInJobsSearchFieldsSort)sort;

@end
