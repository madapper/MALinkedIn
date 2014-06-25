//
//  MALinkedInSession.m
//  MALinkedIn
//
//  Created by Paul Napier on 14/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInSession.h"

@implementation MALinkedInSession

+ (MALinkedInSession*)sharedSession
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}




-(MALinkedInSessionPermissions)getPermission:(NSString *)permissionName{
    NSDictionary *dict = @{
                           @"your profile overview":@(r_basicprofile),
                           @"your full profile":@(r_fullprofile),
                           @"your email address":@(r_emailaddress),
                           @"your connections":@(r_network),
                           @"your contact info":@(r_contactinfo),
                           @"network updates":@(rw_nus),
                           @"group discussions":@(rw_groups),
                           @"invitations and messages":@(w_messages),
                           @"company pages":@(rw_company_admin)
                           };
    return (MALinkedInSessionPermissions)dict[permissionName];
}

-(NSString *)getPermissionName:(MALinkedInSessionPermissions)permission{
    NSDictionary *dict = @{
                           @(r_basicprofile):@"your profile overview",
                           @(r_fullprofile):@"your full profile",
                           @(r_emailaddress):@"your email address",
                           @(r_network):@"your connections",
                           @(r_contactinfo):@"your contact info",
                           @(rw_nus):@"network updates",
                           @(rw_groups):@"group discussions",
                           @(w_messages):@"invitations and messages",
                           @(rw_company_admin):@"company pages"
                           };
    return dict[@(permission)];
}


+(MALinkedInSession *)cachedSession{
    MALinkedInSession *sharedSession = [MALinkedInSession sharedSession];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"linkedInSession"];
    //    NSLog(@"Session Cache: Data - %@",data);
    if (!data) {
        //        NSLog(@"Session Cache: Data - fail");
        return NULL;
    }else{
        //        NSLog(@"Session Cache: Data - Success");
        MALinkedInSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //        NSLog(@"Session Cache: Session - %@",session);
        //        NSLog(@"Session Cache: Token - %@",session.token);
        
        sharedSession.permissions = session.permissions;
        sharedSession.token = session.token;
        sharedSession.expiry = session.expiry;
        return sharedSession;
    }
    
}

-(void)cache{
    //    MALinkedInSession *session = [MALinkedInSession sharedSession];
    [[NSUserDefaults standardUserDefaults]setObject:[NSKeyedArchiver archivedDataWithRootObject:self] forKey:@"linkedInSession"];
}

+(void)clearSharedSession{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"linkedInSession"];
    MALinkedInSession *sharedSession = [MALinkedInSession sharedSession];
    sharedSession.permissions = NULL;
    sharedSession.token = NULL;
    sharedSession.expiry = NULL;
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.token forKey:@"token"];
    [encoder encodeObject:self.expiry forKey:@"expiry"];
    [encoder encodeObject:self.permissions forKey:@"permissions"];
    [encoder encodeObject:self.requestToken forKey:@"requestToken"];
    [encoder encodeObject:self.redirectURL forKey:@"redirectURL"];
    [encoder encodeObject:self.clientID forKey:@"clientID"];
    [encoder encodeObject:self.clientSecret forKey:@"clientSecret"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil )
    {
        self.token = [decoder decodeObjectForKey:@"token"];
        self.expiry = [decoder decodeObjectForKey:@"expiry"];
        self.permissions = [decoder decodeObjectForKey:@"permissions"];
        self.requestToken = [decoder decodeObjectForKey:@"requestToken"];
        self.redirectURL = [decoder decodeObjectForKey:@"redirectURL"];
        self.clientID = [decoder decodeObjectForKey:@"clientID"];
        self.clientSecret = [decoder decodeObjectForKey:@"clientSecret"];
    }
    return self;
}

@end
