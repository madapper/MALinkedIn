//
//  MALinkedInPeopleProfile.h
//  MALinkedIn
//
//  Created by Paul Napier on 14/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedIn.h"
#import "MALinkedInSession.h"
#import "MALinkedInPeopleProfileFields.h"


@interface MALinkedInPeopleProfile : NSObject<MALinkedInConnectionHandlerDelegate>

@property (nonatomic, retain) NSObject *requestedObject;

+(void)requestMe:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestMe:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;

@end
