//
//  MALinkedInGroupsParameters.h
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"


@interface MALinkedInGroupsParameters : NSObject

@property (nonatomic) int params_start;
@property (nonatomic) int params_count;
@property (nonatomic) MALinkedInGroupsParametersOrder params_order;
@property (nonatomic) MALinkedInGroupsParametersRole params_role;
@property (nonatomic) MALinkedInGroupsParametersCategory params_category;
@property (nonatomic) NSDate *params_modified_since;

-(NSString *)getOrder:(MALinkedInGroupsParametersOrder)order;
-(NSString *)getRole:(MALinkedInGroupsParametersRole)role;
-(NSString *)getCategory:(MALinkedInGroupsParametersCategory)category;

@end
