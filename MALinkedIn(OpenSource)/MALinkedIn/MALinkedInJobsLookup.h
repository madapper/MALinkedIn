//
//  MALinkedInJobsLookup.h
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMLDictionary.h"
#import "MALinkedInSession.h"
#import "MALinkedInJobsLookupFields.h"

@interface MALinkedInJobsLookup : NSObject

+(void)requestJob:(MALinkedInSession *)session jobID:(NSString *)jobID fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion;

+(void)requestJobSuggestions:(MALinkedInSession *)session fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion;

+(void)requestJobBookmarks:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;


-(NSString *)stringFromFields:(MALinkedInJobsLookupFields *)fields;
@end
