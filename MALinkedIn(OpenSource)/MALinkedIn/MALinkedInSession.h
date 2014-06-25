//
//  MALinkedInSession.h
//  MALinkedIn
//
//  Created by Paul Napier on 14/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"

@interface MALinkedInSession : NSObject

@property (nonatomic, retain) NSDate *expiry;
@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSArray *permissions;
@property (nonatomic, retain) NSString *requestToken;
@property (nonatomic, retain) NSString *redirectURL;
@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSString *clientSecret;

+ (MALinkedInSession *)sharedSession;
- (MALinkedInSessionPermissions)getPermission:(NSString *)permissionName;
- (NSString *)getPermissionName:(MALinkedInSessionPermissions)permission;

+(MALinkedInSession *)cachedSession;

-(void)cache;
+(void)clearSharedSession;

@end
