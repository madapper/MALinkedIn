//
//  MALinkedInPeopleConnections.h
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedIn.h"
#import "MALinkedInSession.h"
#import "MALinkedInPeopleConnectionsFields.h"

@interface MALinkedInPeopleConnections : NSObject<MALinkedInConnectionHandlerDelegate>

@property (nonatomic, retain) NSObject *requestedObject;

+(void)requestMyConnections:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestMyConnections:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnections:(MALinkedInSession *)session new:(BOOL)newConnections modifiedSince:(NSDate *)date completion:(void (^)(NSObject *object))completion;


@end
