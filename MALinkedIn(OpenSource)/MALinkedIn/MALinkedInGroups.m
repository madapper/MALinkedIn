//
//  MALinkedInGroups.m
//  MALinkedIn
//
//  Created by Paul Napier on 24/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInGroups.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInGroups

+(void)requestMyGroups:(MALinkedInSession *)session start:(int)start count:(int)count completion:(void (^)(NSObject *))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/group-memberships?count=%d&start=%d&%@",count,start,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestMyGroups:(MALinkedInSession *)session start:(int)start count:(int)count fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion{
    
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/group-memberships%@?count=%d&start=%d&%@",[group stringFromFields:fields type:@"Membership"],count,start,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestGroup:(MALinkedInSession *)session groupID:(NSString *)groupID fields:(MALinkedInGroupsFields *)fields parameters:(MALinkedInGroupsParameters *)parameters completion:(void (^)(NSObject *object))completion{
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/groups/%@%@?%@&%@",groupID,[group stringFromFields:fields type:@"Groups"],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token],[group stringFromParameters:parameters]];
        
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

+(void)requestGroupPosts:(MALinkedInSession *)session groupID:(NSString *)groupID fields:(MALinkedInGroupsFields *)fields parameters:(MALinkedInGroupsParameters *)parameters completion:(void (^)(NSObject *object))completion{
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/groups/%@/posts%@?%@&%@",groupID,[group stringFromFields:fields type:@"Posts"],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token],[group stringFromParameters:parameters]];
        
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

+(void)requestPost:(MALinkedInSession *)session postID:(NSString *)postID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/posts/%@%@?%@",postID,[group stringFromFields:fields type:@"Posts"],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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



+(void)requestPostComments:(MALinkedInSession *)session postID:(NSString *)postID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/posts/%@/comments%@?%@",postID,[group stringFromFields:fields type:@"Posts"],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestComment:(MALinkedInSession *)session commentID:(NSString *)commentID fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInGroups *group = [MALinkedInGroups new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/comments/%@%@?%@",commentID,[group stringFromFields:fields type:@"Comments"],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestSuggestedGroups:(MALinkedInSession *)session fields:(MALinkedInGroupsFields *)fields completion:(void (^)(NSObject *object))completion{
    
}

-(NSString *)stringFromFields:(MALinkedInGroupsFields *)fields type:(NSString *)type{
    
    
    NSString *strGroup=@"";
    
    if (fields.group_id){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"id"];
    }
    if (fields.group_name){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"name"];
    }
    if (fields.group_short_description){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"short-description"];
    }
    if (fields.group_description){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"description"];
    }
    if (fields.group_relation_to_viewer_membership_state){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        if (fields.group_relation_to_viewer_available_actions) {
            strGroup = [strGroup stringByAppendingString:@"relation-to-viewer:(membership-state,avaliable-actions)"];
        }else{
            strGroup = [strGroup stringByAppendingString:@"relation-to-viewer:(membership-state)"];
        }
        
    }
    if (fields.group_relation_to_viewer_available_actions){
        
        if (fields.group_relation_to_viewer_membership_state) {
        }else{
            if (strGroup.length>0) {
                strGroup = [strGroup stringByAppendingString:@","];
            }
            strGroup = [strGroup stringByAppendingString:@"relation-to-viewer:(avaliable-actions)"];
        }
    }
    
    if (fields.group_counts_by_category){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"counts-by-category"];
    }
    if (fields.group_is_open_to_non_members){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"is-open-to-non-members"];
    }
    if (fields.group_category){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"category"];
    }
    if (fields.group_website_url){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"website-url"];
    }
    if (fields.group_site_group_url){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"site-group-url"];
    }
    if (fields.group_locale){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"locale"];
    }
    if (fields.group_location_country){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        if (fields.group_location_postal_code) {
            strGroup = [strGroup stringByAppendingString:@"location:(country,postal-code)"];
        }else{
            strGroup = [strGroup stringByAppendingString:@"location:(country)"];
        }
    }
    if (fields.group_location_postal_code){
        
        if (fields.group_location_country) {
        }else{
            if (strGroup.length>0) {
                strGroup = [strGroup stringByAppendingString:@","];
            }
            strGroup = [strGroup stringByAppendingString:@"location:(postal-code)"];
        }
        
    }
    if (fields.group_small_logo_url){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"small-logo-url"];
    }
    if (fields.group_large_logo_url){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"large-logo-url"];
    }
    if (fields.group_num_members){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        strGroup = [strGroup stringByAppendingString:@"num-members"];
    }
    
    
    NSString *strPosts = @"";
    
    if (fields.post_id){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"id"];
    }
    if (fields.post_type){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"type"];
    }
    if (fields.post_category){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"category"];
    }
    if (fields.post_creator){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"creator"];
    }
    if (fields.post_title){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"title"];
    }
    if (fields.post_summary){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"summary"];
    }
    if (fields.post_creation_timestamp){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"creation-timestamp"];
    }
    
    
    if (fields.post_relation_to_viewer_is_following&&fields.post_relation_to_viewer_is_liked&&fields.post_relation_to_viewer_available_actions) {
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(is-following,is-liked-available-actions)"];
    }else if(fields.post_relation_to_viewer_is_following&&fields.post_relation_to_viewer_is_liked){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(is-following,is-liked)"];
    }else if(fields.post_relation_to_viewer_is_following&&fields.post_relation_to_viewer_available_actions){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(is-following,available-actions)"];
    }else if(fields.post_relation_to_viewer_available_actions&&fields.post_relation_to_viewer_is_liked){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(available-actions,is-liked)"];
    }else if(fields.post_relation_to_viewer_is_following){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(is-following)"];
    }else if(fields.post_relation_to_viewer_is_liked){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(is-liked)"];
    }else if(fields.post_relation_to_viewer_available_actions){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"relation-to-viewer:(available-actions)"];
    }
    
    
    if (fields.post_likes){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"likes"];
    }
    
    if (fields.post_attachment){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"attachment"];
    }
    if (fields.post_site_group_post_url){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:@"site-group-post-url"];
    }
    
    NSString *strComment = @"";
    
    if (fields.comment_id){
        if (strComment.length>0) {
            strComment = [strComment stringByAppendingString:@","];
        }
        strComment = [strComment stringByAppendingString:@"id"];
    }
    if (fields.comment_text){
        if (strComment.length>0) {
            strComment = [strComment stringByAppendingString:@","];
        }
        strComment = [strComment stringByAppendingString:@"text"];
    }
    if (fields.comment_creator){
        if (strComment.length>0) {
            strComment = [strComment stringByAppendingString:@","];
        }
        strComment = [strComment stringByAppendingString:@"creator"];
    }
    if (fields.comment_creation_timestamp){
        if (strComment.length>0) {
            strComment = [strComment stringByAppendingString:@","];
        }
        strComment = [strComment stringByAppendingString:@"creation-timestamp"];
    }
    if (fields.comment_relation_to_viewer_available_actions){
        if (strComment.length>0) {
            strComment = [strComment stringByAppendingString:@","];
        }
        strComment = [strComment stringByAppendingString:@"relation-to-viewer:(available-actions)"];
    }
    
    if (fields.post_comments>0){
        if (strPosts.length>0) {
            strPosts = [strPosts stringByAppendingString:@","];
        }
        strPosts = [strPosts stringByAppendingString:[NSString stringWithFormat:@"comments;count=%d%@",fields.post_comments,((strComment.length>0)?[NSString stringWithFormat:@":(%@)",strComment]:@"")]];
    }
    
    
    if (fields.group_posts>0){
        if (strGroup.length>0) {
            strGroup = [strGroup stringByAppendingString:@","];
        }
        if (strPosts.length>0) {
            strGroup = [strGroup stringByAppendingString:[NSString stringWithFormat:@"posts;count=%d:(%@)",fields.group_posts,strPosts]];
        }else{
            strGroup = [strGroup stringByAppendingString:[NSString stringWithFormat:@"posts;count=%d",fields.group_posts]];
        }
    }
    
    NSString *final = @"";
    
    if ([type isEqualToString:@"Membership"]) {
        final = [NSString stringWithFormat:@":(group:(%@))",strGroup];
    }else if ([type isEqualToString:@"Groups"]){
        final = [NSString stringWithFormat:@":(%@)",strGroup];
    }else if ([type isEqualToString:@"Posts"]){
        final = [NSString stringWithFormat:@":(%@)",strPosts];
    }else if ([type isEqualToString:@"Comments"]){
        final = [NSString stringWithFormat:@":(%@)",strComment];
    }
    
    return final;
}

-(NSString *)stringFromParameters:(MALinkedInGroupsParameters *)paramters{
    NSString *strParams = @"";
    
    if(paramters.params_start>0){
        if (strParams.length>0) {
            strParams = [strParams stringByAppendingString:@"&"];
        }
        strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"start=%d",paramters.params_start]];
    }
    if(paramters.params_count>0){
        if (strParams.length>0) {
            strParams = [strParams stringByAppendingString:@"&"];
        }
        strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"count=%d",paramters.params_count]];
    }
       if(paramters.params_order>0){
           if (strParams.length>0) {
               strParams = [strParams stringByAppendingString:@"&"];
           }
           strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"order=%@",[paramters getOrder:paramters.params_order]]];
       }
       if(paramters.params_role>0){
           if (strParams.length>0) {
               strParams = [strParams stringByAppendingString:@"&"];
           }
           strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"role=%@",[paramters getRole:paramters.params_role]]];
       }
       if(paramters.params_category>0){
           if (strParams.length>0) {
               strParams = [strParams stringByAppendingString:@"&"];
           }
           strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"category=%@",[paramters getCategory:paramters.params_category]]];
       }
       if(paramters.params_modified_since){
           if (strParams.length>0) {
               strParams = [strParams stringByAppendingString:@"&"];
           }
           
           strParams = [strParams stringByAppendingString:[NSString stringWithFormat:@"modified-since=%f",[paramters.params_modified_since timeIntervalSinceReferenceDate]]];
       }
    
    return strParams;
}

@end
