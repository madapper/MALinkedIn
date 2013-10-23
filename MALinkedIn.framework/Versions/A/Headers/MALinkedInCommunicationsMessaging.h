//
//  MALinkedInCommunicationsMessaging.h
//  MALinkedIn
//
//  Created by Paul Napier on 17/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MALinkedInSession.h"
#import "MALinkedInConnectionHandler.h"
#import "MALinkedInCommunicationsMessagingView.h"
#import "MALinkedInCommunicationsRecipient.h"


@interface MALinkedInCommunicationsMessaging : NSObject<MALinkedInConnectionHandlerDelegate,MALinkedInCommunicationsMessagingViewDelegate>

// Contacts must be an array of MALinkedInCommunicationsRecipient
@property (nonatomic, retain) MALinkedInSession *session;

+(void)message:(MALinkedInSession *)session contacts:(NSArray *)contacts delegate:(UIViewController *)vc;

+(void)messageTest:(MALinkedInSession *)session xml:(BOOL)xml;

@end
