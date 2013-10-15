//
//  MALinkedInPeopleSearchFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 16/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"

@interface MALinkedInPeopleSearchFields : NSObject

@property (nonatomic, retain) NSString *field_location;
@property (nonatomic, retain) NSString *field_industry;
@property (nonatomic) MALinkedInPeopleSearchFieldsNetwork field_network;
@property (nonatomic) MALinkedInPeopleSearchFieldsLanguage field_language;
@property (nonatomic, retain) NSString *field_current_company;
@property (nonatomic, retain) NSString *field_past_company;
@property (nonatomic, retain) NSString *field_school;

-(NSString *)getNetwork:(MALinkedInPeopleSearchFieldsNetwork)network;
-(NSString *)getLanguage:(MALinkedInPeopleSearchFieldsLanguage)language;

@end
