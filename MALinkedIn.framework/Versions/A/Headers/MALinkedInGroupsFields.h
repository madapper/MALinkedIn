//
//  MALinkedInGroupsFields.h
//  MALinkedIn
//
//  Created by Paul Napier on 24/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MALinkedInGroupsFields : NSObject

@property (nonatomic) bool group_id;
@property (nonatomic) bool group_name;
@property (nonatomic) bool group_short_description;
@property (nonatomic) bool group_description;
@property (nonatomic) bool group_relation_to_viewer_membership_state;
@property (nonatomic) bool group_relation_to_viewer_available_actions;
@property (nonatomic) int group_posts;
@property (nonatomic) bool group_counts_by_category;
@property (nonatomic) bool group_is_open_to_non_members;
@property (nonatomic) bool group_category;
@property (nonatomic) bool group_website_url;
@property (nonatomic) bool group_site_group_url;
@property (nonatomic) bool group_locale;
@property (nonatomic) bool group_location_country;
@property (nonatomic) bool group_location_postal_code;
@property (nonatomic) bool group_small_logo_url;
@property (nonatomic) bool group_large_logo_url;
@property (nonatomic) bool group_num_members;


@property (nonatomic) bool post_id;
@property (nonatomic) bool post_type;
@property (nonatomic) bool post_category;
@property (nonatomic) bool post_creator;
@property (nonatomic) bool post_title;
@property (nonatomic) bool post_summary;
@property (nonatomic) bool post_creation_timestamp;
@property (nonatomic) bool post_relation_to_viewer_is_following;
@property (nonatomic) bool post_relation_to_viewer_is_liked;
@property (nonatomic) bool post_relation_to_viewer_available_actions;
@property (nonatomic) bool post_likes;
@property (nonatomic) int post_comments;
@property (nonatomic) bool post_attachment;
@property (nonatomic) bool post_site_group_post_url;


@property (nonatomic) bool comment_id;
@property (nonatomic) bool comment_text;
@property (nonatomic) bool comment_creator;
@property (nonatomic) bool comment_creation_timestamp;
@property (nonatomic) bool comment_relation_to_viewer_available_actions;


@end
