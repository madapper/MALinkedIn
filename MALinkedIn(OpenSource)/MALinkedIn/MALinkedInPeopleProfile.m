//
//  MALinkedInPeopleProfile.m
//  MALinkedIn
//
//  Created by Paul Napier on 14/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInPeopleProfile.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInPeopleProfile

+(void)requestMe:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
    
}
+(void)requestMe:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *))completion{
    
    
    
    MALinkedInPeopleProfile *profile = [MALinkedInPeopleProfile new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSArray *fieldArray = [profile arrayFromFields:components inSession:session];
        NSString *fields = @"";
        if (fieldArray.count>0) {
            fields = @":(";
            for (int a = 0; a<fieldArray.count; a++) {
                if (a>0) {
                    fields = [fields stringByAppendingString:@","];
                }
                fields = [fields stringByAppendingString:fieldArray[a]];
            }
            fields = [fields stringByAppendingString:@")"];
        }
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~%@?%@",fields,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
    
}

+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@?%@",uid,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]]]];
        
        XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
        NSDictionary *dictJsonData;
        NSDictionary *dictXML = [parser dictionaryWithData:data];
        if (dictXML) {
            dictJsonData = dictXML;
        }else{
            NSError *error;
            dictJsonData = [NSJSONSerialization
                            JSONObjectWithData:data
                            options:kNilOptions
                            error:&error];
        }
        
        completion(dictJsonData);
    });
    
}
+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleProfile *profile = [MALinkedInPeopleProfile new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSArray *fieldArray = [profile arrayFromFields:components inSession:session];
        NSString *fields = @"";
        if (fieldArray.count>0) {
            fields = @":(";
            for (int a = 0; a<fieldArray.count; a++) {
                if (a>0) {
                    fields = [fields stringByAppendingString:@","];
                }
                fields = [fields stringByAppendingString:fieldArray[a]];
            }
            fields = [fields stringByAppendingString:@")"];
        }
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@%@?%@",uid,fields,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
}

+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleProfile *profile = [MALinkedInPeopleProfile new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url2 = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/url=%@?%@",[profile urlEncodeValue:url],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url2);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url2]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url2]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
    
}
+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleProfile *profile = [MALinkedInPeopleProfile new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSArray *fieldArray = [profile arrayFromFields:components inSession:session];
        NSString *fields = @"";
        if (fieldArray.count>0) {
            fields = @":(";
            for (int a = 0; a<fieldArray.count; a++) {
                if (a>0) {
                    fields = [fields stringByAppendingString:@","];
                }
                fields = [fields stringByAppendingString:fieldArray[a]];
            }
            fields = [fields stringByAppendingString:@")"];
        }
        
        NSString *url2 =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/url=%@%@?%@",[profile urlEncodeValue:url],fields,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url2);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url2]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url2]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
}

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}

-(NSArray *)arrayFromFields:(MALinkedInPeopleProfileFields *)fields inSession:(MALinkedInSession *)session{
    
    NSMutableArray *getArray = [NSMutableArray new];
    
    if(fields.field_r_basicprofile_id) [getArray addObject:@"id"];
    if(fields.field_r_basicprofile_first_name) [getArray addObject:@"first-name"];
    if(fields.field_r_basicprofile_last_name) [getArray addObject:@"last-name"];
    if(fields.field_r_basicprofile_maiden_name) [getArray addObject:@"maiden-name"];
    if(fields.field_r_basicprofile_formatted_name) [getArray addObject:@"formatted-name"];
    if(fields.field_r_basicprofile_phonetic_first_name) [getArray addObject:@"phonetic-first-name"];
    if(fields.field_r_basicprofile_phonetic_last_name) [getArray addObject:@"phonetic-last-name"];
    if(fields.field_r_basicprofile_formatted_phonetic_name) [getArray addObject:@"formatted-phonetic-name"];
    if(fields.field_r_basicprofile_headline) [getArray addObject:@"headline"];
    if(fields.field_r_basicprofile_location_name){
        if(fields.field_r_basicprofile_location_country_code){
            [getArray addObject:@"location:(name,country:(code))"];
        }else{
            [getArray addObject:@"location:(name)"];
        }
    }
    if(fields.field_r_basicprofile_location_country_code&&!fields.field_r_basicprofile_location_name){
        if(fields.field_r_basicprofile_location_name){
            
        }else{
            [getArray addObject:@"location:(country:(code))"];
        }
    }
    if(fields.field_r_basicprofile_industry) [getArray addObject:@"industry"];
    if(fields.field_r_basicprofile_distance) [getArray addObject:@"distance"];
    //    if(fields.field_r_basicprofile_relation_to_viewer_distance) [getArray addObject:[NSString stringWithFormat:@"relation-to-viewer-distance:(%d)",fields.field_r_basicprofile_relation_to_viewer_distance]];
    if(fields.field_r_basicprofile_current_share) [getArray addObject:@"current-share"];
    if(fields.field_r_basicprofile_num_connections) [getArray addObject:@"num-connections"];
    if(fields.field_r_basicprofile_num_connections_capped) [getArray addObject:@"num-connections-capped"];
    if(fields.field_r_basicprofile_summary) [getArray addObject:@"summary"];
    if(fields.field_r_basicprofile_specialties) [getArray addObject:@"specialties"];
    if(fields.field_r_basicprofile_positions)[getArray addObject:@"positions"];
    if(fields.field_r_basicprofile_picture_url) [getArray addObject:@"picture-urls::(original)"];
    if(fields.field_r_basicprofile_site_standard_profile_request) [getArray addObject:@"site-standard-profile-request"];
    if(fields.field_r_basicprofile_api_standard_profile_request_url) [getArray addObject:@"api-standard-profile-request:(url)"];
    if(fields.field_r_basicprofile_public_profile_url) [getArray addObject:@"public-profile-url"];
    
    if ([session.permissions containsObject:[session getPermissionName:r_fullprofile]]) {
        //        NSLog(@"Permission: r_fullprofile");
        if(fields.field_r_fullprofile_last_modified_timestamp) [getArray addObject:@"last-modified-timestamp"];
        if(fields.field_r_fullprofile_proposal_comments) [getArray addObject:@"proposal-comments"];
        if(fields.field_r_fullprofile_associations) [getArray addObject:@"associations"];
        if(fields.field_r_fullprofile_interests) [getArray addObject:@"interests"];
        if(fields.field_r_fullprofile_publications) [getArray addObject:@"publications"];
        if(fields.field_r_fullprofile_patents) [getArray addObject:@"patents"];
        if(fields.field_r_fullprofile_languages) [getArray addObject:@"languages"];
        if(fields.field_r_fullprofile_certifications) [getArray addObject:@"certifications"];
        if(fields.field_r_fullprofile_educations) [getArray addObject:@"educations"];
        if(fields.field_r_fullprofile_courses) [getArray addObject:@"courses"];
        if(fields.field_r_fullprofile_volunteer) [getArray addObject:@"volunteer"];
        if(fields.field_r_fullprofile_three_current_positions) [getArray addObject:@"three-current-positions"];
        if(fields.field_r_fullprofile_three_past_positions) [getArray addObject:@"three-past-positions"];
        if(fields.field_r_fullprofile_num_recommenders) [getArray addObject:@"num-recommenders"];
        if(fields.field_r_fullprofile_recommendations_received) [getArray addObject:@"recommendations-received"];
        if(fields.field_r_fullprofile_mfeed_rss_url) [getArray addObject:@"mfeed-rss-url"];
        if(fields.field_r_fullprofile_following) [getArray addObject:@"following"];
        if(fields.field_r_fullprofile_job_bookmarks) [getArray addObject:@"job-bookmarks"];
        if(fields.field_r_fullprofile_suggestions) [getArray addObject:@"suggestions"];
        if(fields.field_r_fullprofile_date_of_birth) [getArray addObject:@"date-of-birth"];
        
        NSString *url = @"";
        if (fields.field_r_fullprofile_member_url_resources_url) {
            url = [url stringByAppendingString:@"url"];
        }
        
        if (fields.field_r_fullprofile_member_url_resources_name) {
            if (url.length>0) {
                url = [url stringByAppendingString:@","];
            }
            url = [url stringByAppendingString:@"name"];
        }
        
        if (fields.field_r_fullprofile_member_url_resources||fields.field_r_fullprofile_member_url_resources_url||fields.field_r_fullprofile_member_url_resources_name) {
            NSString *resources = @"member-url-resources";
            if (url.length>0) {
                resources = [resources stringByAppendingString:[NSString stringWithFormat:@":(%@)",url]];
            }
        }
        
        if(fields.field_r_fullprofile_related_profile_views) [getArray addObject:@"related-profile-views"];
        if(fields.field_r_fullprofile_honors_awards) [getArray addObject:@"honors-awards"];
    }
    
    if ([session.permissions containsObject:[session getPermissionName:r_emailaddress]]) {
        //        NSLog(@"Permission: r_emailaddress");
        if(fields.field_r_emailaddress_email_address) [getArray addObject:@"email-address"];
    }
    
    if ([session.permissions containsObject:[session getPermissionName:r_contactinfo]]) {
        //        NSLog(@"Permission: r_contactinfo");
        if(fields.field_r_contactinfo_phone_numbers) [getArray addObject:@"phone-numbers"];
        if(fields.field_r_contactinfo_bound_account_types) [getArray addObject:@"bound-account-types"];
        if(fields.field_r_contactinfo_im_accounts) [getArray addObject:@"im-accounts"];
        if(fields.field_r_contactinfo_main_address) [getArray addObject:@"main-address"];
        if(fields.field_r_contactinfo_twitter_accounts) [getArray addObject:@"twitter-accounts"];
        if(fields.field_r_contactinfo_primary_twitter_account) [getArray addObject:@"primary-twitter-account"];
    }
    
    if ([session.permissions containsObject:[session getPermissionName:r_network]]) {
        //        NSLog(@"Permission: r_network");
        if(fields.field_r_network_connections) [getArray addObject:@"network-connections"];
    }
    
    if ([session.permissions containsObject:[session getPermissionName:rw_groups]]) {
        //        NSLog(@"Permission: rw_groups");
        if(fields.field_rw_groups_group_memberships) [getArray addObject:@"group-memberships"];
    }
    
    if ([session.permissions containsObject:[session getPermissionName:rw_nus]]) {
        //        NSLog(@"Permission: rw_nus");
        if(fields.field_rw_nus_network) [getArray addObject:@"network"];
    }
    
    return getArray;
}

@end
