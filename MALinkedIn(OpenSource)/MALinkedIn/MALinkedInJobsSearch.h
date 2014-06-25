//
//  MALinkedInJobsSearch.h
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMLDictionary.h"
#import "MALinkedInEnums.h"
#import "MALinkedInJobsSearchParameters.h"
#import "MALinkedInJobsSearchFacets.h"
#import "MALinkedInJobsLookup.h"
#import "MALinkedInSession.h"

@interface MALinkedInJobsSearch : NSObject


+(void)requestJobSearch:(MALinkedInSession *)session parameters:(MALinkedInJobsSearchParameters *)parameters fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion;

@end
