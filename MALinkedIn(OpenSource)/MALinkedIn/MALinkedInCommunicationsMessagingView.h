//
//  MALinkedInCommunicationsMessaging.h
//  MALinkedIn
//
//  Created by Paul Napier on 17/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MALinkedInCommunicationsMessagingView;

@protocol MALinkedInCommunicationsMessagingViewDelegate

@optional
-(void)messagingViewDidCancel:(MALinkedInCommunicationsMessagingView *)messagingView;
-(void)messagingViewDidSendMessage:(MALinkedInCommunicationsMessagingView *)messagingView;
@end

@interface MALinkedInCommunicationsMessagingView : UIView<UITextFieldDelegate, UITextViewDelegate>{
    UIView *messageView;
    
    UIView *topBar;
    CAGradientLayer *gLayer;
    
    UIView *messageContainer;
    UIView *messageSubcontainer;
    
    UIView *toView;
    UILabel *toLabel;
    
    UIButton *toButton;
    UIView *toHorizontal;
    UIView *toVertical;
    
    UIView *subjectView;
    UILabel *subjectLabel;
    
    UIView *subjectHorizontal;
    UIView *subjectVertical;
    
    UITextField *currentTextField;
    UITextView *currentTextView;
    
    CGRect messageViewFrame;
    
    UIButton *iv;
}

@property (nonatomic, retain) NSObject<MALinkedInCommunicationsMessagingViewDelegate> *delegate;

@property (nonatomic, retain) UITextField *fromTextField;
@property (nonatomic, retain) UITextField *toTextField;
@property (nonatomic, retain) UITextField *subjectTextField;
@property (nonatomic, retain) UITextView *body;
@property (nonatomic, retain) UIButton *cancel;
@property (nonatomic, retain) UIButton *send;

@property (nonatomic, retain) NSArray *recipients;

-(void)messageViewDismiss;

@end
