//
//  MALinkedInLogInView.h
//  TestLinkedIn
//
//  Created by Paul Napier on 9/10/13.
//  Copyright (c) 2013 We Are Social. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMBlurView.h"
#import "TFHpple.h"
#import "MALinkedInConnectionHandler.h"
#import "MALinkedInSession.h"


@import QuartzCore;

@class MALinkedInLogInView;

@protocol MALinkedInViewDelegate

@optional

-(void)linkedInViewDidLogIn:(MALinkedInSession *)session;

@end

@interface MALinkedInLogInView : UIView<UIWebViewDelegate, UITextFieldDelegate,MALinkedInConnectionHandlerDelegate>{
    
    AMBlurView *blurView;
    UIWebView *wv;
    BOOL initailLoadDone;
    
    UIView *topBanner;
    UIView *container;
    UIView *info;
    UIView *action;
    UIView *textFields;
    UITextField *username;
    UITextField *password;
    UIButton *allow;
    UIButton *cancel;
    
    UITextField *currentTextField;
    UIView *loginView;
    
    UILabel *requestLabel;
    UIButton *iv;
    
    CGRect loginViewFrame;
    CGSize keyboardSize;
    BOOL receivedOAuth;
    NSMutableArray *permissions;
    NSString *request_token;
    
}

@property (nonatomic, retain) NSObject<MALinkedInViewDelegate> *delegate;
@property (nonatomic, retain) NSString *redirectURL;
@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSString *clientSecret;

+(void)initWithDelegate:(NSObject<MALinkedInViewDelegate> *)vc redirectURL:(NSString *)redirectURL clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;
-(id)initWithRedirectURL:(NSString *)redirectURL clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

@end
