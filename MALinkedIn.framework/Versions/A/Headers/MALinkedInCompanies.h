//
//  MALinkedInCompanies.h
//  MALinkedIn
//
//  Created by Paul Napier on 16/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedIn.h"
#import "MALinkedInSession.h"
#import "MALinkedInCompaniesFields.h"

@interface MALinkedInCompanies : NSObject<MALinkedInConnectionHandlerDelegate>

@property (nonatomic, retain) NSObject *requestedObject;

+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid withUniversalName:(NSString *)withUniversalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;

+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withUniversalName:(NSString *)withUniversalName completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withUniversalName:(NSString *)withUniversalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;

+(void)requestCompany:(MALinkedInSession *)session withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session withUniversalName:(NSString *)universalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;


+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withUniversalName:(NSString *)universalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion;
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid withUniversalName:(NSString *)withUniversalName completion:(void (^)(NSObject *object))completion;

+(void)requestMyAdminCompanies:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;


@end
