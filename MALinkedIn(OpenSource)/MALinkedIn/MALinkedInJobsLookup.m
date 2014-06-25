//
//  MALinkedInJobsLookup.m
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInJobsLookup.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInJobsLookup

+(void)requestJob:(MALinkedInSession *)session jobID:(NSString *)jobID fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInJobsLookup *lookup = [MALinkedInJobsLookup new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/jobs/%@%@?%@",jobID,[lookup stringFromFields:fields],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestJobSuggestions:(MALinkedInSession *)session fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInJobsLookup *lookup = [MALinkedInJobsLookup new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/suggestions/job-suggestions:(jobs%@)?%@",[lookup stringFromFields:fields],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestJobBookmarks:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{

    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/job-bookmarks?%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

-(NSString *)stringFromFields:(MALinkedInJobsLookupFields *)fields{
    NSString *strFields = @"";
    
    
    if(fields.field_id){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"id"];
    }
    if(fields.field_customer_job_code){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"customer-job-code"];
    }
    if(fields.field_active){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"active"];
    }
    if(fields.field_posting_date){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"posting-date"];
    }
    if(fields.field_expiration_date){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"expiration-date"];
    }
    if(fields.field_posting_timestamp){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"posting-timestamp"];
    }
    if(fields.field_expiration_timestamp){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"expiration-timestamp"];
    }
    
    NSString *strCompany = @"";
    
    if(fields.field_company_id){
        if (strCompany.length>0) {
            strCompany = [strCompany stringByAppendingString:@","];
        }
        strCompany = [strCompany stringByAppendingString:@"id"];
    }
    if(fields.field_company_name){
        if (strCompany.length>0) {
            strCompany = [strCompany stringByAppendingString:@","];
        }
        strCompany = [strCompany stringByAppendingString:@"name"];
    }
    
    if (strCompany.length>0) {
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"company:(%@)",strCompany]];
    }
    
    NSString *strPosition = @"";
    
    if(fields.field_position_title){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"title"];
    }
    if(fields.field_position_location){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"location"];
    }
    if(fields.field_position_job_functions){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"job-functions"];
    }
    if(fields.field_position_industries){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"industries"];
    }
    if(fields.field_position_job_type){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"job-type"];
    }
    if(fields.field_position_experience_level){
        if (strPosition.length>0) {
            strPosition = [strPosition stringByAppendingString:@","];
        }
        strPosition = [strPosition stringByAppendingString:@"experience-level"];
    }
    
    if (strPosition.length>0) {
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"position:(%@)",strPosition]];
    }
    
    if(fields.field_skills_and_experience){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"skills-and-experience"];
    }
    
    
    if(fields.field_description_snippet){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"description-snippet"];
    }
    if(fields.field_description){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"description"];
    }
    
    if(fields.field_salary){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"salary"];
    }
    
    NSString *strPoster = @"";
    
    if(fields.field_job_poster_id){
        if (strPoster.length>0) {
            strPoster = [strPoster stringByAppendingString:@","];
        }
        strPoster = [strPoster stringByAppendingString:@"id"];
    }
    if(fields.field_job_poster_first_name){
        if (strPoster.length>0) {
            strPoster = [strPoster stringByAppendingString:@","];
        }
        strPoster = [strPoster stringByAppendingString:@"first-name"];
    }
    if(fields.field_job_poster_last_name){
        if (strPoster.length>0) {
            strPoster = [strPoster stringByAppendingString:@","];
        }
        strPoster = [strPoster stringByAppendingString:@"last-name"];
    }
    if(fields.field_job_poster_headline){
        if (strPoster.length>0) {
            strPoster = [strPoster stringByAppendingString:@","];
        }
        strPoster = [strPoster stringByAppendingString:@"headline"];
    }
    
    if (strPoster.length>0) {
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"job-poster:(%@)",strPoster]];
    }
    
    if(fields.field_referral_bonus){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"referral-bonus"];
    }
    if(fields.field_site_job_url){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"site-job-url"];
    }
    if(fields.field_location_description){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@","];
        }
        strFields = [strFields stringByAppendingString:@"location-description"];
    }
    
    if (strFields.length>0) {
        strFields = [NSString stringWithFormat:@":(%@)",strFields];
    }
    
    return strFields;
}

@end
