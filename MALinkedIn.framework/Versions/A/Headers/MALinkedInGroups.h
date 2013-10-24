//
//  MALinkedInGroups.h
//  MALinkedIn
//
//  Created by Paul Napier on 24/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInSession.h"
#import "XMLDictionary.h"
#import "MALinkedInGroupsFields.h"
#import "MALinkedInGroupsParameters.h"

@interface MALinkedInGroups : NSObject

+(void)requestMyGroups:(MALinkedInSession *)session start:(int)start count:(int)count completion:(void (^)(NSObject *object))completion;

+(void)requestMyGroups:(MALinkedInSession *)session start:(int)start count:(int)count fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion;


+(void)requestGroup:(MALinkedInSession *)session groupID:(NSString *)groupID fields:(MALinkedInGroupsFields *)fields parameters:(MALinkedInGroupsParameters *)parameters completion:(void (^)(NSObject *object))completion;

+(void)requestGroupPosts:(MALinkedInSession *)session groupID:(NSString *)groupID fields:(MALinkedInGroupsFields *)fields parameters:(MALinkedInGroupsParameters *)parameters completion:(void (^)(NSObject *object))completion;

+(void)requestPost:(MALinkedInSession *)session postID:(NSString *)postID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion;

+(void)requestPostComments:(MALinkedInSession *)session postID:(NSString *)postID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion;

+(void)requestComment:(MALinkedInSession *)session commentID:(NSString *)commentID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion;

+(void)requestSuggestedGroups:(MALinkedInSession *)session fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion;

@end
