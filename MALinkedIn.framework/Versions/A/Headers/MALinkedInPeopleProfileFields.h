//
//  MALinkedInPeopleProfileFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MALinkedInEnums.h"



@interface MALinkedInPeopleProfileFields : NSObject

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
@property (nonatomic, retain) NSString *field_r_basicprofile_location_name;
@property (nonatomic, retain) NSString *field_r_basicprofile_location_country_code; // Lower case values as defined by ISO 3166-1 alpha-2 standard. (http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)
@property (nonatomic) BOOL field_r_basicprofile_industry;
@property (nonatomic) BOOL field_r_basicprofile_distance;
@property (nonatomic) MALinkedInPeopleProfileFieldsDistance field_r_basicprofile_relation_to_viewer_distance;
@property (nonatomic) BOOL field_r_basicprofile_current_share;
@property (nonatomic) BOOL field_r_basicprofile_num_connections;
@property (nonatomic) BOOL field_r_basicprofile_num_connections_capped;
@property (nonatomic) BOOL field_r_basicprofile_summary;
@property (nonatomic) BOOL field_r_basicprofile_specialties;
@property (nonatomic) BOOL field_r_basicprofile_positions;
@property (nonatomic) BOOL field_r_basicprofile_picture_url;
@property (nonatomic) BOOL field_r_basicprofile_site_standard_profile_request;
@property (nonatomic, retain) NSString *field_r_basicprofile_api_standard_profile_request_url;
@property (nonatomic) BOOL field_r_basicprofile_public_profile_url;

// Permission: r_emailaddress
@property (nonatomic) BOOL field_r_emailaddress_email_address;

// Permission: r_fullprofile
@property (nonatomic) BOOL field_r_fullprofile_last_modified_timestamp;
@property (nonatomic) BOOL field_r_fullprofile_proposal_comments;
@property (nonatomic) BOOL field_r_fullprofile_associations;
@property (nonatomic) BOOL field_r_fullprofile_interests;
@property (nonatomic) BOOL field_r_fullprofile_publications;
@property (nonatomic) BOOL field_r_fullprofile_patents;
@property (nonatomic) BOOL field_r_fullprofile_languages;
@property (nonatomic) BOOL field_r_fullprofile_certifications;
@property (nonatomic) BOOL field_r_fullprofile_educations;
@property (nonatomic) BOOL field_r_fullprofile_courses;
@property (nonatomic) BOOL field_r_fullprofile_volunteer;
@property (nonatomic) BOOL field_r_fullprofile_three_current_positions;
@property (nonatomic) BOOL field_r_fullprofile_three_past_positions;
@property (nonatomic) BOOL field_r_fullprofile_num_recommenders;
@property (nonatomic) BOOL field_r_fullprofile_recommendations_received;
@property (nonatomic) BOOL field_r_fullprofile_mfeed_rss_url;
@property (nonatomic) BOOL field_r_fullprofile_following;
@property (nonatomic) BOOL field_r_fullprofile_job_bookmarks;
@property (nonatomic) BOOL field_r_fullprofile_suggestions;
@property (nonatomic) BOOL field_r_fullprofile_date_of_birth;
@property (nonatomic) BOOL field_r_fullprofile_member_url_resources;
@property (nonatomic, retain) NSString *field_r_fullprofile_member_url_resources_url;
@property (nonatomic, retain) NSString *field_r_fullprofile_member_url_resources_name;
@property (nonatomic) BOOL field_r_fullprofile_related_profile_views;
@property (nonatomic) BOOL field_r_fullprofile_honors_awards;

// Permission: r_contactinfo
@property (nonatomic) BOOL field_r_contactinfo_phone_numbers;
@property (nonatomic) BOOL field_r_contactinfo_bound_account_types;
@property (nonatomic) BOOL field_r_contactinfo_im_accounts;
@property (nonatomic) BOOL field_r_contactinfo_main_address;
@property (nonatomic) BOOL field_r_contactinfo_twitter_accounts;
@property (nonatomic) BOOL field_r_contactinfo_primary_twitter_account;

// Permission: r_network
@property (nonatomic) BOOL field_r_network_connections;

// Permission: rw_groups
@property (nonatomic) BOOL field_rw_groups_group_memberships;

// Permission: rw_nus
@property (nonatomic) BOOL field_rw_nus_network;

@end
