//
//  MALinkedInSocialNetworkFields.m
//  MALinkedIn
//
//  Created by Paul Napier on 23/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInSocialNetworkFields.h"

@implementation MALinkedInSocialNetworkFields

-(NSString *)getType:(MALinkedInSocialNetworkFieldsType)type{
    NSDictionary *dict = @{
                           @(MALinkedInSocialNetworkFieldsTypeAPPS):@"APPS",
                           @(MALinkedInSocialNetworkFieldsTypeCMPY):@"CMPY",
                           @(MALinkedInSocialNetworkFieldsTypeCONN):@"CONN",
                           @(MALinkedInSocialNetworkFieldsTypeJOBS):@"JOBS",
                           @(MALinkedInSocialNetworkFieldsTypeJGRP):@"JGRP",
                           @(MALinkedInSocialNetworkFieldsTypePICT):@"PICT",
                           @(MALinkedInSocialNetworkFieldsTypePRFX):@"PRFX",
                           @(MALinkedInSocialNetworkFieldsTypeRECU):@"RECU",
                           @(MALinkedInSocialNetworkFieldsTypePRFU):@"PRFU",
                           @(MALinkedInSocialNetworkFieldsTypeSHAR):@"SHAR",
                           @(MALinkedInSocialNetworkFieldsTypeVIRL):@"VIRL",
                           };
    return dict[@(type)];
}

@end
