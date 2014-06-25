//
//  MALinkedInSocialNetwork.m
//  MALinkedIn
//
//  Created by Paul Napier on 23/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInSocialNetwork.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInSocialNetwork

+(void)requestMyUpdates:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/network/updates?scope=self&%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestUpdates:(MALinkedInSession *)session fields:(MALinkedInSocialNetworkFields *)fields completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/network/updates?%@&%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token],[[[MALinkedInSocialNetwork new]arrayFromFields:fields]componentsJoinedByString:@"&"]];
        
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

+(void)requestConnectionUpdates:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/network/updates?%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestUpdates:(MALinkedInSession *)session userID:(NSString *)uid completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@/network/updates?scope=self&%@",uid,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

+(void)requestUpdates:(MALinkedInSession *)session userID:(NSString *)uid fields:(MALinkedInSocialNetworkFields *)fields completion:(void (^)(NSObject *object))completion{
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/id=%@/network/updates?scope=self&%@&%@",uid,[NSString stringWithFormat:@"oauth2_access_token=%@",session.token],[[[MALinkedInSocialNetwork new]arrayFromFields:fields]componentsJoinedByString:@"&"]];
        
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



+(void)requestNetworkStats:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/network/network-stats?%@",[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
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

-(NSArray *)arrayFromFields:(MALinkedInSocialNetworkFields *)fields{
    
    NSMutableArray *getArray = [NSMutableArray new];
    
    if(fields.field_after){
     [getArray addObject:[NSString stringWithFormat:@"start=%f",[fields.field_after timeIntervalSinceReferenceDate]]];
    }
    if(fields.field_before){
     [getArray addObject:[NSString stringWithFormat:@"start=%f",[fields.field_before timeIntervalSinceReferenceDate]]];
    }
    if(fields.field_count>0) [getArray addObject:[NSString stringWithFormat:@"count=%d",fields.field_count]];
    if(fields.field_scope) [getArray addObject:@"scope=self"];
    if(fields.field_show_hidden_members) [getArray addObject:@"show-hidden-members=true"];
    if(fields.field_start>0) [getArray addObject:[NSString stringWithFormat:@"start=%d",fields.field_start]];
    
    for (int a = 0; a<fields.field_type.count; a++) {
        MALinkedInSocialNetworkFieldsType type = (MALinkedInSocialNetworkFieldsType)[fields.field_type[a] integerValue];
        [getArray addObject:[NSString stringWithFormat:@"type=%@",[fields getType:type]]];
    }
    
    
    return getArray;
}

@end
