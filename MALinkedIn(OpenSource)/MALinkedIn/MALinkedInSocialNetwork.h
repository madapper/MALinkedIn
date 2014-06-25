//
//  MALinkedInSocialNetwork.h
//  MALinkedIn
//
//  Created by Paul Napier on 23/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInSocialNetworkFields.h"
#import "MALinkedInSession.h"
#import "XMLDictionary.h"

@interface MALinkedInSocialNetwork : NSObject

+(void)requestMyUpdates:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestUpdates:(MALinkedInSession *)session fields:(MALinkedInSocialNetworkFields *)fields completion:(void (^)(NSObject *object))completion;
+(void)requestConnectionUpdates:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;

+(void)requestUpdates:(MALinkedInSession *)session userID:(NSString *)uid completion:(void (^)(NSObject *object))completion;
+(void)requestUpdates:(MALinkedInSession *)session userID:(NSString *)uid fields:(MALinkedInSocialNetworkFields *)fields completion:(void (^)(NSObject *object))completion;
+(void)requestNetworkStats:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;

@end
