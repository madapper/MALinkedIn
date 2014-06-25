//
//  MALinkedInCompanies.m
//  MALinkedIn
//
//  Created by Paul Napier on 16/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInCompanies.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInCompanies

+(void)requestCompany:(MALinkedInSession *)session
               fields:(MALinkedInCompaniesFields *)fields
               withID:(NSString *)cid
    withUniversalName:(NSString *)universalName
      withEmailDomain:(NSString *)emailDomain
           completion:(void (^)(NSObject *object))completion
{
    
    MALinkedInCompanies *company = [MALinkedInCompanies new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *keys = @"";
        
        if (cid&&universalName) {
            keys = [NSString stringWithFormat:@"::(%@,universal-name=%@)",cid,[company urlEncodeValue:universalName]];
        }else if (cid){
            keys = [NSString stringWithFormat:@"/%@",cid];
        }else if (universalName){
            keys = [NSString stringWithFormat:@"/universal-name=%@",[company urlEncodeValue:universalName]];
        }
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/companies%@%@?%@",keys,[company buildFields:fields],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url]};
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

+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:cid withUniversalName:NULL withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:cid withUniversalName:NULL withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:cid withUniversalName:universalName withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session withID:(NSString *)cid withUniversalName:(NSString *)universalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:cid withUniversalName:universalName withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)requestCompany:(MALinkedInSession *)session withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:NULL withUniversalName:universalName withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session withUniversalName:(NSString *)universalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:NULL withUniversalName:universalName withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:NULL withID:NULL withUniversalName:NULL withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}


+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:cid withUniversalName:NULL withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:NULL withUniversalName:universalName withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:cid withUniversalName:NULL withEmailDomain:emailDomain     completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withUniversalName:(NSString *)universalName withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:NULL withUniversalName:universalName withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withEmailDomain:(NSString *)emailDomain completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:NULL withUniversalName:NULL withEmailDomain:emailDomain completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}
+(void)requestCompany:(MALinkedInSession *)session fields:(MALinkedInCompaniesFields *)fields withID:(NSString *)cid withUniversalName:(NSString *)universalName completion:(void (^)(NSObject *object))completion{
    [MALinkedInCompanies requestCompany:session fields:fields withID:cid withUniversalName:universalName withEmailDomain:NULL completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)requestMyAdminCompanies:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion{
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/companies?%@",[NSString stringWithFormat:@"oauth2_access_token=%@is-company-admin=true",session.token]];
        
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


-(NSString *)buildFields:(MALinkedInCompaniesFields *)fields{
    
    if (fields) {
        
        NSString *input = @"";
        
        if (fields.field_id) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"id"];
        }
        if (fields.field_name) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"name"];
        }
        if (fields.field_universal_name) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"universal-name"];
        }
        if (fields.field_email_domains) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"email-domains"];
        }
        if (fields.field_company_type) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"company-type"];
        }
        if (fields.field_ticker) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"ticker"];
        }
        if (fields.field_website_url) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"website-url"];
        }
        if (fields.field_industries) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"industries"];
        }
        if (fields.field_status) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"status"];
        }
        if (fields.field_logo_url) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"logo-url"];
        }
        if (fields.field_square_logo_url) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"square-logo-url"];
        }
        if (fields.field_blog_rss_url) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"blog-rss-url"];
        }
        if (fields.field_twitter_id) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"twitter-id"];
        }
        if (fields.field_employee_count_range) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"employee-count-range"];
        }
        if (fields.field_specialties) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"specialties"];
        }
        if (fields.field_locations) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations"];
        }
        if (fields.field_locations_description) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(description)"];
        }
        if (fields.field_locations_is_headquarters) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(is-headquarters)"];
        }
        if (fields.field_locations_is_active) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(is-active)"];
        }
        if (fields.field_locations_address) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address)"];
        }
        if (fields.field_locations_address_street1) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(street1))"];
        }
        if (fields.field_locations_address_street2) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(street2))"];
        }
        if (fields.field_locations_address_city) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(city))"];
        }
        if (fields.field_locations_address_state) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(state))"];
        }
        if (fields.field_locations_address_postal_code) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(postal-code))"];
        }
        if (fields.field_locations_address_country_code) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(country-code))"];
        }
        if (fields.field_locations_address_region_code) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(address:(region-code))"];
        }
        if (fields.field_locations_contact_info) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(contact-info)"];
        }
        if (fields.field_locations_contact_info_phone1) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(contact-info:(phone1))"];
        }
        if (fields.field_locations_contact_info_phone2) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(contact-info:(phone2))"];
        }
        if (fields.field_locations_contact_info_fax) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"locations:(contact-info:(fax))"];
        }
        if (fields.field_description) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"description"];
        }
        if (fields.field_stock_exchange) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"stock-exchange"];
        }
        if (fields.field_founded_year) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"founded-year"];
        }
        if (fields.field_end_year) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"end-year"];
        }
        if (fields.field_num_followers) {
            if (input.length>0) {
                input = [input stringByAppendingString:@","];
            }
            input = [input stringByAppendingString:@"num-followers"];
        }
        
        return (input.length>0)?[NSString stringWithFormat:@":(%@)",input]:@"";
    }else{
        return @"";
    }
    
}

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}

@end
