//
//  MALinkedInConnectionsFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"

@interface MALinkedInPeopleConnectionsFields : NSObject

//Permission: r_basicprofile
@property (nonatomic) BOOL field_r_basicprofile_id;
@property (nonatomic) BOOL field_r_basicprofile_first_name;
@property (nonatomic) BOOL field_r_basicprofile_last_name;
@property (nonatomic) BOOL field_r_basicprofile_maiden_name;
@property (nonatomic) BOOL field_r_basicprofile_formatted_name;
@property (nonatomic) BOOL field_r_basicprofile_phonetic_first_name;
@property (nonatomic) BOOL field_r_basicprofile_phonetic_last_name;
@property (nonatomic) BOOL field_r_basicprofile_formatted_phonetic_name;
@property (nonatomic) BOOL field_r_basicprofile_headline;
@property (nonatomic) BOOL field_r_basicprofile_location_name;
@property (nonatomic) BOOL field_r_basicprofile_location_country_code;
@property (nonatomic) BOOL field_r_basicprofile_industry;
@property (nonatomic) BOOL field_r_basicprofile_distance;
@property (nonatomic) BOOL field_r_basicprofile_relation_to_viewer_distance;
@property (nonatomic) BOOL field_r_basicprofile_current_share;
@property (nonatomic) BOOL field_r_basicprofile_num_connections;
@property (nonatomic) BOOL field_r_basicprofile_num_connections_capped;
@property (nonatomic) BOOL field_r_basicprofile_summary;
@property (nonatomic) BOOL field_r_basicprofile_specialties;
@property (nonatomic) BOOL field_r_basicprofile_positions;
@property (nonatomic) BOOL field_r_basicprofile_picture_url;
@property (nonatomic) BOOL field_r_basicprofile_site_standard_profile_request;
@property (nonatomic) BOOL field_r_basicprofile_api_standard_profile_request_url;
@property (nonatomic) BOOL field_r_basicprofile_public_profile_url;
@property (nonatomic) BOOL field_r_basicprofile_start;
@property (nonatomic) BOOL field_r_basicprofile_count;
@property (nonatomic) BOOL field_r_basicprofile_modified;
@property (nonatomic) BOOL field_r_basicprofile_modified_since;

@end
