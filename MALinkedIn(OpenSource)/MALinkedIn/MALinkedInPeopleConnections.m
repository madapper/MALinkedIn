//
//  MALinkedInPeopleConnections.m
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInPeopleConnections.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInPeopleConnections

+(void)requestMyConnections:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/connections?%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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
+(void)requestMyConnections:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleConnections *profile = [MALinkedInPeopleConnections new];
    
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
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/connections%@?%@",fields,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@/connections?%@",uid,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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
+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleConnections *profile = [MALinkedInPeopleConnections new];
    
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
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@/connections%@?%@",uid,fields,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleConnections *profile = [MALinkedInPeopleConnections new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url2 = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/url=%@/connections?%@",[profile urlEncodeValue:url],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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
+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion{
    MALinkedInPeopleConnections *profile = [MALinkedInPeopleConnections new];
    
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

        NSString *url2 = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/url=%@/connections?%@",[profile urlEncodeValue:url],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestConnections:(MALinkedInSession *)session new:(BOOL)newConnections modifiedSince:(NSDate *)date completion:(void (^)(NSObject *object))completion{
    
    NSString *str = @"";
    
    if (newConnections) {
        str = @"modified=new";
    }
    if (date) {
        if (newConnections) {
            str = [str stringByAppendingString:@"&"];
        }
        NSTimeInterval seconds = [NSDate timeIntervalSinceReferenceDate]-[date timeIntervalSinceReferenceDate];
        float milliseconds = seconds*1000;
        str = [str stringByAppendingString:[NSString stringWithFormat:@"modified-since=%d&",(int)milliseconds]];
    }
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/connections?%@%@",str,[NSString stringWithFormat:@"&oauth2_access_token=%@",session.token]];
        
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

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}

-(NSArray *)arrayFromFields:(MALinkedInPeopleConnectionsFields *)fields inSession:(MALinkedInSession *)session{
    
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
        if (fields.field_r_basicprofile_location_country_code) {
            [getArray addObject:@"location:(name,country:(code))"];
        }else{
            [getArray addObject:@"location:(name)"];
        }
    }
    if(fields.field_r_basicprofile_location_country_code){
        if (fields.field_r_basicprofile_location_name) {
            
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
    if(fields.field_r_basicprofile_positions) [getArray addObject:@"positions"];
    if(fields.field_r_basicprofile_picture_url) [getArray addObject:@"picture-url"];
    if(fields.field_r_basicprofile_site_standard_profile_request) [getArray addObject:@"site-standard-profile-request"];
    if(fields.field_r_basicprofile_api_standard_profile_request_url) [getArray addObject:@"api-standard-profile-request-url"];
    if(fields.field_r_basicprofile_public_profile_url) [getArray addObject:@"public-profile-url"];
    if(fields.field_r_basicprofile_start) [getArray addObject:@"start"];
    if(fields.field_r_basicprofile_count) [getArray addObject:@"count"];
    if(fields.field_r_basicprofile_modified) [getArray addObject:@"modified"];
    if(fields.field_r_basicprofile_modified_since) [getArray addObject:@"modified-since"];
    
    
    
    return getArray;
}


@end
