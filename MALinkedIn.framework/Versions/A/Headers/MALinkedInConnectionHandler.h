//
//  MALinkedIn.h
//  TestLinkedIn
//
//  Created by Paul Napier on 4/10/13.
//  Copyright (c) 2013 We Are Social. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDictionary.h"

#define ERRORLOG_POST true
#define ERRORLOG_CONNECTIONSTATUS false
#define ERRORLOG_DATA false
#define ERRORLOG_FINISHEDLOADING false

@class MALinkedInConnectionHandler;

@protocol MALinkedInConnectionHandlerDelegate

@optional

-(void)connectionHandlerDidFinishLoading:(NSObject *)object;

@end

@interface MALinkedInConnectionHandler : NSObject<NSURLConnectionDelegate>

@property (nonatomic, retain) NSObject<MALinkedInConnectionHandlerDelegate> *delegate;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic) int intConnectionType;
@property (nonatomic, retain) NSMutableData *receivedData;
@property (nonatomic) NSStringEncoding encoding;
@property (nonatomic) bool isConnecting;

-(void)connectToURL:(NSString *)url post:(NSString *)post;
-(void)connectToURL:(NSString *)url get:(NSString *)get;

@end
