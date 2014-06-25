//
//  MALinkedIn.m
//  TestLinkedIn
//
//  Created by Paul Napier on 4/10/13.
//  Copyright (c) 2013 We Are Social. All rights reserved.
//

#import "MALinkedInConnectionHandler.h"

@implementation MALinkedInConnectionHandler

-(void)connectToURL:(NSString *)url post:(NSString *)post{
    
    [self.connection cancel];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if (ERRORLOG_POST) NSLog(@"%@\nPost:%@",url,post);
    NSData *postData = [ NSData dataWithBytes: [ post UTF8String ] length: [ post length ] ];
//    NSLog(@"%@",postData);
//    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"xml" forHTTPHeaderField:@"x-li-format"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    self.isConnecting = true;
    [self.connection start];
}


- (NSString *)_signatureBaseString:(NSString *)url session:(MALinkedInSession *)session
{
    
	NSMutableArray *chunks = [[NSMutableArray alloc] init];
    [chunks addObject:[NSString stringWithFormat:@"oauth_consumer_key=\"%@\"", [self encodedURLParameterString:@"chj4mdcmn3v4"]]];//session.clientID]]];
    [chunks addObject:[NSString stringWithFormat:@"oauth_token=\"%@\"",[self encodedURLParameterString:session.token]]];
    [chunks addObject:[NSString stringWithFormat:@"oauth_signature_method=\"%@\"", [self encodedURLParameterString:@"HMAC-SHA1"]]];
    [chunks addObject:[NSString stringWithFormat:@"oauth_timestamp=\"%ld\"", time(NULL)]];
    [chunks addObject:[NSString stringWithFormat:@"oauth_nonce=\"%@\"", [self generateNonce]]];
    [chunks	addObject:@"oauth_version=\"1.0\""];
    [chunks addObject:@"realm=\"http://api.linkedin.com/\""];
    
    
    NSString *normalizedRequestParameters = [chunks componentsJoinedByString:@"&"];
    
    // OAuth Spec, Section 9.1.2 "Concatenate Request Elements"
    return [NSString stringWithFormat:@"POST&%@&%@",
            url,
            [self encodedURLParameterString:normalizedRequestParameters]];
}


-(void)connectToURL:(NSString *)url get:(NSString *)get{
    
    [self.connection cancel];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    if (ERRORLOG_POST) NSLog(@"%@?%@",url,get);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",url,get]]];
    [request setHTTPMethod:@"GET"];
    
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    self.isConnecting = true;
    [self.connection start];
}

- (NSString *)generateNonce
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
	
    return (NSString *)CFBridgingRelease(string);
}

- (NSString *)encodedURLParameterString:(NSString *)string {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)string,
                                                                           NULL,
                                                                           CFSTR(":/=,!$&\"()*+;[]@#?"),
                                                                           kCFStringEncodingUTF8));
	return result;
}

#pragma mark Connection delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (ERRORLOG_CONNECTIONSTATUS) NSLog(@"Received Response");
    
    self.receivedData = nil;
    CFStringEncoding cfEncoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)
                                                                           [response textEncodingName]);
	self.encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (ERRORLOG_CONNECTIONSTATUS) NSLog(@"Received Data");
	if (!self.receivedData)
	{
		// no store yet, make one
		self.receivedData = [[NSMutableData alloc] initWithData:data];
	}
	else
	{
		// append to previous chunks
		[self.receivedData appendData:data];
	}
}

// all worked
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.isConnecting = false;
    if (ERRORLOG_CONNECTIONSTATUS) NSLog(@"Finished Loading");
    if (self.receivedData!=NULL) {
        if(ERRORLOG_FINISHEDLOADING) NSLog(@"received");
        
        XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
        
        
//        NSLog(@"%@",dictXML);
        NSDictionary *dictJsonData;
        
        NSDictionary *dictXML = [parser dictionaryWithData:self.receivedData];
        if (dictXML) {
            NSLog(@"1");
            dictJsonData = dictXML;
        }else{
        NSLog(@"2");
        NSError *error;
        dictJsonData = [NSJSONSerialization
                                      JSONObjectWithData:self.receivedData
                                      options:kNilOptions
                                      error:&error];
        }
        if (ERRORLOG_DATA) NSLog(@"%@",dictJsonData);
        if (dictJsonData) {
            if(ERRORLOG_FINISHEDLOADING) NSLog(@"JSON not null");
            if ([self.delegate respondsToSelector:@selector(connectionHandlerDidFinishLoading:)]) {
                [self.delegate connectionHandlerDidFinishLoading:dictJsonData];
            }
        }else{
            if(ERRORLOG_FINISHEDLOADING) NSLog(@"JSON does not exist");
        }
    }
    
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

// and error occured
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (ERRORLOG_CONNECTIONSTATUS)  NSLog(@"Failed: %@",error);
    self.isConnecting = false;
    NSDictionary *dict = @{@"ConnectionType": [NSNumber numberWithInt:self.intConnectionType],@"JSONData":@{@"error": error}};
    if (ERRORLOG_DATA) NSLog(@"%@",dict);
    
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

//to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if (ERRORLOG_CONNECTIONSTATUS) NSLog(@"Authenticated");
	return [protectionSpace.authenticationMethod
			isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if (ERRORLOG_CONNECTIONSTATUS) NSLog(@"Challenged");
	if ([challenge.protectionSpace.authenticationMethod
		 isEqualToString:NSURLAuthenticationMethodServerTrust])
	{
		// we only trust our own domain
		//if ([challenge.protectionSpace.host isEqualToString:URL_SECURITY])
		//{
        NSURLCredential *credential =
        [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
		//}
	}
    
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)dealloc
{
	[self.connection cancel];
	
}


@end
