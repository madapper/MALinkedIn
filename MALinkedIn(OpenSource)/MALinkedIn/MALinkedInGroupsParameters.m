//
//  MALinkedInGroupsParameters.m
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInGroupsParameters.h"

@implementation MALinkedInGroupsParameters

-(NSString *)getOrder:(MALinkedInGroupsParametersOrder)order{
    NSDictionary *dict = @{
                           @(MALinkedInGroupsParametersOrderRecency):@"recency",
                           @(MALinkedInGroupsParametersOrderPopularity):@"popularity",
                           };
    return dict[@(order)];
}
-(NSString *)getRole:(MALinkedInGroupsParametersRole)role{
    NSDictionary *dict = @{
                           @(MALinkedInGroupsParametersRoleCreator):@"creator",
                           @(MALinkedInGroupsParametersRoleCommenter):@"commenter",
                           @(MALinkedInGroupsParametersRoleFollower):@"follower",
                           };
    return dict[@(role)];
}
-(NSString *)getCategory:(MALinkedInGroupsParametersCategory)category{
    NSDictionary *dict = @{
                           @(MALinkedInGroupsParametersCategoryDiscussion):@"discussion",
                           };
    return dict[@(category)];
}

@end