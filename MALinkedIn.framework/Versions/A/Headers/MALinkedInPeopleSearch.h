//
//  MALinkedInPeopleSearch.h
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedIn.h"
#import "MALinkedInSession.h"
#import "MALinkedInPeopleSearchFacets.h"
#import "MALinkedInPeopleSearchFields.h"

/*
This feature is intended for LinkedIn members to find people they know or discover people and insights from their network. It may not be used for the purposes of database matching, candidate sourcing, or lead generation without an established business relationship with LinkedIn. For information on partnership opportunities, and how to apply, visit the LinkedIn Partner Programs page. (http://developer.linkedin.com/partner)
 
Search results may not be stored or offered as aggregated search.
 
All API calls must be made within an active user session.
 
You cannot let multiple people search using the authentication credentials of one person. Each person must authenticate individually.

 If you have questions, see the LinkedIn Platform Guidelines for more information. (http://developer.linkedin.com/documents/linkedin-platform-guidelines)
 */

@interface MALinkedInPeopleSearch : NSObject<MALinkedInConnectionHandlerDelegate>

@property (nonatomic, retain) NSObject *requestedObject;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
 company_name:(NSString *)company_name
current_company:(bool)current_company
        title:(NSString *)title
current_title:(bool)current_title
  school_name:(NSString *)school_name
current_school:(bool)current_school
 country_code:(NSString *)country_code
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;



+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;



+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;



+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;



+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion;

+(void)searchFacets:(MALinkedInSession *)session facets:(MALinkedInPeopleSearchFacets *)facets fields:(MALinkedInPeopleSearchFields *)fields completion:(void (^)(NSObject *object))completion;

@end
