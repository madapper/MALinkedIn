//
//  MALinkedInSocialNetworkFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 23/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"

@interface MALinkedInSocialNetworkFields : NSObject

@property (nonatomic) bool field_scope;
@property (nonatomic) int field_count;
@property (nonatomic) int field_start;
@property (nonatomic, retain) NSDate *field_after;
@property (nonatomic, retain) NSDate *field_before;
@property (nonatomic) bool field_show_hidden_members;
@property (nonatomic, retain) NSArray *field_type; // Array of MALinkedInSocialNetworkFieldsType

-(NSString *)getType:(MALinkedInSocialNetworkFieldsType)type;

@end
