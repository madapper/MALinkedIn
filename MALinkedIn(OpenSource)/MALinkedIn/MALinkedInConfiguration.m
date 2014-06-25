//
//  MALinkedInConfiguration.m
//  MALinkedIn
//
//  Created by Paul Napier on 30/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInConfiguration.h"

@implementation MALinkedInConfiguration

+ (MALinkedInConfiguration *)sharedConfig
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

@end
