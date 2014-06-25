//
//  MALinkedInConfiguration.h
//  MALinkedIn
//
//  Created by Paul Napier on 30/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MALinkedInConfiguration : NSObject

@property (nonatomic) BOOL showURL;
@property (nonatomic) BOOL showObject;

+ (MALinkedInConfiguration *)sharedConfig;

@end
