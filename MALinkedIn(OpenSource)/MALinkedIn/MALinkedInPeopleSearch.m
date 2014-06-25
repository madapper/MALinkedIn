//
//  MALinkedInPeopleSearch.m
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInPeopleSearch.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInPeopleSearch

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
 company_name:(NSString *)company_name
current_company:(bool)current_company
        title:(NSString *)title
current_title:(bool)current_title
  school_name:(NSString *)school_name
current_school:(bool)current_school
 country_code:(NSString *)country_code
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
        start:(int)start
   completion:(void (^)(NSObject *object))completion {
    
    MALinkedInPeopleSearch *search = [MALinkedInPeopleSearch new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *strKeywords = (keywords)?[NSString stringWithFormat:@"&keywords=%@",[search urlEncodeValue:keywords]]:@"";
        NSString *strFirstName = (first_name)?[NSString stringWithFormat:@"&first-name=%@",[search urlEncodeValue:first_name]]:@"";
        NSString *strLastName = (last_name)?[NSString stringWithFormat:@"&last-name=%@",[search urlEncodeValue:last_name]]:@"";
        NSString *strCompanyName = (company_name)?[NSString stringWithFormat:@"&company-name=%@",[search urlEncodeValue:company_name]]:@"";
        NSString *strCurrentCompany = (current_company)?@"&current-company=true":@"";
        NSString *strTitle = (title)?[NSString stringWithFormat:@"&title=%@",[search urlEncodeValue:title]]:@"";
        NSString *strCurrentTitle = (current_title)?@"&current-title=true":@"";
        NSString *strSchoolName = (school_name)?[NSString stringWithFormat:@"&school-name=%@",[search urlEncodeValue:school_name]]:@"";
        NSString *strCurrentSchool = (current_school)?@"&current-school=true":@"";
        NSString *strCountryCode = (country_code)?[NSString stringWithFormat:@"&country-code=%@",[search urlEncodeValue:country_code]]:@"";
        NSString *strPostalCode = (postal_code)?[NSString stringWithFormat:@"&postal-code=%@",[search urlEncodeValue:postal_code]]:@"";
        NSString *strDistance = (distance>0)?[NSString stringWithFormat:@"&distance=%d",distance]:@"";
        NSString *strCount = (count>0)?[NSString stringWithFormat:@"&count=%d",count]:@"";
        NSString *strSort = (sort)?[NSString stringWithFormat:@"&sort=%@",[search urlEncodeValue:sort]]:@"";
        NSString *strStart = (start>0)?[NSString stringWithFormat:@"&start=%d",start]:@"";
    
        NSString *url = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people-search?oauth2_access_token=%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",session.token,strKeywords,strFirstName,strLastName,strCompanyName,strCurrentCompany,strTitle,strCurrentTitle,strSchoolName,strCurrentSchool,strCountryCode,strPostalCode,strDistance,strCount,strSort,strStart];
        
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

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:keywords first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:keywords first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:keywords first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:keywords first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:postal_code distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
     keyWords:(NSString *)keywords
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:keywords first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:country_code postal_code:NULL distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}



+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:first_name last_name:last_name company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:first_name last_name:last_name company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:first_name last_name:last_name company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:first_name last_name:last_name company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:postal_code distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
   first_name:(NSString *)first_name
    last_name:(NSString *)last_name
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:first_name last_name:last_name company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:country_code postal_code:NULL distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}



+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:company_name current_company:current_company title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:company_name current_company:current_company title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:company_name current_company:current_company title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:company_name current_company:current_company title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:NULL postal_code:postal_code distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
 company_name:(NSString *)company_name
current_company:(bool)current_company
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:company_name current_company:current_company title:NULL current_title:NULL school_name:NULL current_school:NULL country_code:country_code postal_code:NULL distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}



+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:title current_title:current_title school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:title current_title:current_title school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:0 sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:title current_title:current_title school_name:NULL current_school:NULL country_code:NULL postal_code:NULL distance:0 count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:title current_title:current_title school_name:NULL current_school:NULL country_code:NULL postal_code:postal_code distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
        title:(NSString *)title
current_title:(bool)current_title
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:title current_title:current_title school_name:NULL current_school:NULL country_code:country_code postal_code:NULL distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}



+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:school_name current_school:current_school country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:school_name current_school:current_school country_code:NULL postal_code:NULL distance:0 count:0 sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:NULL title:NULL current_title:NULL school_name:school_name current_school:current_school country_code:NULL postal_code:NULL distance:0 count:0 sort:NULL start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
  postal_code:(NSString *)postal_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:false title:NULL current_title:false school_name:school_name current_school:current_school country_code:NULL postal_code:postal_code distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)search:(MALinkedInSession *)session
  school_name:(NSString *)school_name
current_school:(bool)current_school
 country_code:(NSString *)country_code
     distance:(int)distance
        count:(int)count
         sort:(NSString *)sort
   start:(int)start
   completion:(void (^)(NSObject *object))completion{
    [MALinkedInPeopleSearch search:session keyWords:NULL first_name:NULL last_name:NULL company_name:NULL current_company:false title:NULL current_title:false school_name:school_name current_school:current_school country_code:country_code postal_code:NULL distance:distance count:count sort:sort start:start completion:^(NSObject *object) {
        if (object) {
            completion(object);
        }
    }];
}

+(void)searchFacets:(MALinkedInSession *)session facets:(MALinkedInPeopleSearchFacets *)facets fields:(MALinkedInPeopleSearchFields *)fields completion:(void (^)(NSObject *object))completion{
    
    MALinkedInPeopleSearch *search = [MALinkedInPeopleSearch new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people-search%@?%@",[search buildFacet:facets],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]]]];
        
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

-(NSString *)buildFacet:(MALinkedInPeopleSearchFacets *)facets{
    if (facets) {
        NSString *facet = @"";
        
        if (facets.facet_name) {
            facet = [facet stringByAppendingString:@"name"];
        }
        if (facets.facet_code) {
            if (facets.facet_name) {
                facet = [facet stringByAppendingString:@","];
            }
            facet = [facet stringByAppendingString:@"code"];
        }
        if (facets.facet_bucket) {
            if (facets.facet_name||facets.facet_code) {
                facet = [facet stringByAppendingString:@","];
            }
            facet = [facet stringByAppendingString:[NSString stringWithFormat:@"buckets:(%@)",[self buildBucket:facets.facet_bucket]]];
        }
        return [NSString stringWithFormat:@":(facets:(%@))",facet];
    }else{
        return @"";
    }
    
}

-(NSString *)buildBucket:(MALinkedInPeopleSearchBucket *)buckets{
    
    NSString *bucket = @"";
    
    if (buckets.bucket_name) {
        bucket = [bucket stringByAppendingString:@"name"];
    }
    
    if (buckets.bucket_code) {
        if (buckets.bucket_name) {
            bucket = [bucket stringByAppendingString:@","];
        }
        bucket = [bucket stringByAppendingString:@"code"];
    }
    
    if (buckets.bucket_count) {
        if (buckets.bucket_name||buckets.bucket_code) {
            bucket = [bucket stringByAppendingString:@","];
        }
        bucket = [bucket stringByAppendingString:@"count"];
    }
    
    if (buckets.bucket_selected||buckets.bucket_code||buckets.bucket_count) {
        if (buckets.bucket_name) {
            bucket = [bucket stringByAppendingString:@","];
        }
        bucket = [bucket stringByAppendingString:@"selected"];
    }
    return bucket;
}

-(NSString *)buildField:(MALinkedInPeopleSearchFields *)fields{
    if (fields) {
        NSString *facet = @"";
        
        NSString *field = @"";
        
        if (fields.field_location) {
            facet= [facet stringByAppendingString:@"location"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=location,%@",[self urlEncodeValue:fields.field_location]]];
        }
        
        if (fields.field_industry) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"industry"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=industry,%@",[self urlEncodeValue:fields.field_industry]]];
        }
        
        if (fields.field_network>0) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"network"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=network,%@",[self urlEncodeValue:[fields getNetwork:fields.field_network]]]];
        }
        
        if (fields.field_language>0) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"language"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=language,%@",[self urlEncodeValue:[fields getLanguage:fields.field_language]]]];
        }
        
        if (fields.field_current_company) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"current-company"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=current-company,%@",[self urlEncodeValue:fields.field_current_company]]];
        }
        
        if (fields.field_past_company) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"past-company"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=past-company,%@",[self urlEncodeValue:fields.field_past_company]]];
        }
        
        if (fields.field_school) {
            if (![field isEqualToString:@""]) {
                facet = [facet stringByAppendingString:@","];
            }
            facet= [facet stringByAppendingString:@"school"];
            field = [field stringByAppendingString:[NSString stringWithFormat:@"&facet=school,%@",[self urlEncodeValue:fields.field_school]]];
        }
        return [NSString stringWithFormat:@"%@%@",((![facet isEqualToString:@""])?[NSString stringWithFormat:@"&facets=%@",facet]:@""),field];
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

