//
//  MALinkedInJobsSearchFields.m
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInJobsSearchParameters.h"

@implementation MALinkedInJobsSearchParameters

-(NSString *)getSort:(MALinkedInJobsSearchFieldsSort)sort{
    NSDictionary *dict = @{
                           @(MALinkedInJobsSearchFieldsRelationship):@"R",
                               @(MALinkedInJobsSearchFieldsDatePostedAsc):@"DA",
                               @(MALinkedInJobsSearchFieldsDatePostedDesc):@"DD",
                           };
    return dict[@(sort)];
}

@end
