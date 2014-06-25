//
//  MALinkedInCommunicationsMessaging.m
//  MALinkedIn
//
//  Created by Paul Napier on 17/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInCommunicationsMessagingView.h"

@implementation MALinkedInCommunicationsMessagingView

-(id)init{
    self = [super init];
    if (self) {
        CGRect superFrame = [[UIScreen mainScreen]bounds];
        //        self.backgroundColor = [UIColor redColor];
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
            self.frame = CGRectMake(0, 0, superFrame.size.width, superFrame.size.height);
        } else {
            self.frame = CGRectMake(0, 0, superFrame.size.height, superFrame.size.width);
        }
        
        iv = [UIButton buttonWithType:UIButtonTypeCustom];
        iv.frame = self.bounds;
        iv.backgroundColor = [UIColor colorWithWhite:0.667 alpha:0.300];
        [iv addTarget:self action:@selector(resignResponder) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iv];
        
        [self createMessageView];
        messageViewFrame = messageView.frame;
        self.alpha = 0;
        messageView.frame = CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y+messageView.frame.size.height+40, messageView.frame.size.width, messageView.frame.size.height);
        [UIView animateWithDuration:0.35 animations:^{
            messageView.frame = messageViewFrame;
            self.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
        
        
        [self performSelector:@selector(addObervers) withObject:nil afterDelay:0.05];

    }
    return self;
}

-(void)cancelPressed{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(messagingViewDidCancel:)]) {
            [self.delegate messagingViewDidCancel:self];
        }
    }
}

-(void)sendPressed{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(messagingViewDidSendMessage:)]) {
            [self.delegate messagingViewDidSendMessage:self];
        }
    }
}

-(void)messageViewDismiss{
    [UIView animateWithDuration:0.35 animations:^{
       messageView.frame = CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y+messageView.frame.size.height+40, messageView.frame.size.width, messageView.frame.size.height);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)createMessageView{
    messageView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, self.bounds.size.width-40, self.bounds.size.height-40)];
    [self addSubview:messageView];
    
    topBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, messageView.frame.size.width, 44)];
    
    gLayer = [CAGradientLayer layer];
    gLayer.frame = topBar.bounds;
    gLayer.colors = @[
                      (id)[[UIColor colorWithRed:0.965 green:0.956 blue:0.941 alpha:1.000]CGColor],
                      (id)[[UIColor colorWithRed:0.723 green:0.705 blue:0.687 alpha:1.000]CGColor],
                      ];
    
    [topBar.layer addSublayer:gLayer];
    
    [messageView addSubview:topBar];
    
    
    self.send = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.send.frame  = CGRectMake(topBar.frame.size.width-82, 7, 75, 30);
    [topBar addSubview:self.send];
    [self.send setTitle:@"Send" forState:UIControlStateNormal];
    [self.send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.send setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.send addTarget:self action:@selector(sendPressed) forControlEvents:UIControlEventTouchUpInside];
    CAGradientLayer *gLayer2 = [CAGradientLayer layer];
    gLayer2.frame = self.send.bounds;
    gLayer2.colors = @[
                       (id)[[UIColor colorWithRed:0.124 green:0.400 blue:0.659 alpha:1.000]CGColor],
                       (id)[[UIColor colorWithRed:0.108 green:0.299 blue:0.483 alpha:1.000]CGColor],
                       ];
    gLayer2.cornerRadius = 3;
    [self.send.layer addSublayer:gLayer2];
    self.send.layer.cornerRadius = 3;
    
    self.cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancel.frame  = CGRectMake(7, 7, 75, 30);
    [self.cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancel setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.cancel addTarget:self action:@selector(cancelPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.cancel addTarget:self action:@selector(messageViewDismiss) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:self.cancel];
    CAGradientLayer *gLayer3 = [CAGradientLayer layer];
    gLayer3.frame = self.cancel.bounds;
    gLayer3.colors = @[
                       (id)[[UIColor colorWithRed:0.933 green:0.172 blue:0.091 alpha:1.000]CGColor],
                       (id)[[UIColor colorWithRed:0.798 green:0.008 blue:0.051 alpha:1.000]CGColor],
                       ];
    gLayer3.cornerRadius = 3;
    [self.cancel.layer addSublayer:gLayer3];
    
    
    messageContainer = [[UIView alloc]initWithFrame:CGRectMake(0, topBar.frame.origin.y+topBar.frame.size.height-5, messageView.frame.size.width, messageView.frame.size.height-topBar.frame.size.height-topBar.frame.origin.y+5)];
    messageContainer.layer.cornerRadius = 5;
    messageContainer.clipsToBounds = true;
    
    messageContainer.backgroundColor = [UIColor colorWithPatternImage:[self randomBG]];
    messageContainer.layer.borderColor = [[UIColor colorWithWhite:0.667 alpha:0.500]CGColor];
    messageContainer.layer.borderWidth = 1;
    [messageView insertSubview:messageContainer belowSubview:topBar];
    
    messageSubcontainer = [[UIView alloc]initWithFrame:CGRectMake(10, -5, messageContainer.frame.size.width-20, messageContainer.frame.size.height-5)];
    messageSubcontainer.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];;
    messageSubcontainer.layer.borderColor = [[UIColor colorWithWhite:0.667 alpha:0.500]CGColor];
    messageSubcontainer.layer.cornerRadius = 5;
    messageSubcontainer.clipsToBounds = true;
    [messageContainer addSubview:messageSubcontainer];
    
    toView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, messageSubcontainer.frame.size.width, 30)];
    [messageSubcontainer addSubview:toView];
    toLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 75, toView.frame.size.height)];
    toLabel.text = @"To:";
    [toView addSubview:toLabel];
    
    self.toTextField = [[UITextField alloc]initWithFrame:CGRectMake(toLabel.frame.size.width+toLabel.frame.origin.x+5, 0, toView.frame.size.width-toLabel.frame.size.width+toLabel.frame.origin.x-5, toView.frame.size.height)];
    self.toTextField.placeholder = @"to";
    self.toTextField.delegate = self;
    self.toTextField.userInteractionEnabled = false;
    [toView addSubview:self.toTextField];
    
    toHorizontal = [[UIView alloc]initWithFrame:CGRectMake(0, toView.frame.size.height-1, toView.frame.size.width, 1)];
    toHorizontal.backgroundColor = [UIColor lightGrayColor];
    [toView addSubview:toHorizontal];
    
    toVertical = [[UIView alloc]initWithFrame:CGRectMake(toLabel.frame.size.width+toLabel.frame.origin.x, 0, 1, toView.frame.size.height-0)];
    toVertical.backgroundColor = [UIColor lightGrayColor];
    [toView addSubview:toVertical];
    
    subjectView = [[UIView alloc]initWithFrame:CGRectMake(0, toView.frame.origin.y+toView.frame.size.height, messageSubcontainer.frame.size.width, 30)];
    [messageSubcontainer addSubview:subjectView];
    subjectLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 75, subjectView.frame.size.height)];
    subjectLabel.text = @"Subject:";
    [subjectView addSubview:subjectLabel];
    
    self.subjectTextField = [[UITextField alloc]initWithFrame:CGRectMake(subjectLabel.frame.size.width+subjectLabel.frame.origin.x+5, 0, subjectView.frame.size.width-subjectLabel.frame.size.width+subjectLabel.frame.origin.x-5, subjectView.frame.size.height)];
    self.subjectTextField.delegate=self;
    self.subjectTextField.placeholder = @"subject";
    [subjectView addSubview:self.subjectTextField];
    
    subjectHorizontal = [[UIView alloc]initWithFrame:CGRectMake(0, subjectView.frame.size.height-1, subjectView.frame.size.width, 1)];
    subjectHorizontal.backgroundColor = [UIColor lightGrayColor];
    [subjectView addSubview:subjectHorizontal];
    
    subjectVertical = [[UIView alloc]initWithFrame:CGRectMake(subjectLabel.frame.size.width+subjectLabel.frame.origin.x, 0, 1, toView.frame.size.height-0)];
    subjectVertical.backgroundColor = [UIColor lightGrayColor];
    [subjectView addSubview:subjectVertical];
    
    self.body = [[UITextView alloc]initWithFrame:CGRectMake(0, subjectView.frame.origin.y+subjectView.frame.size.height, messageSubcontainer.frame.size.width, messageSubcontainer.frame.size.height-(subjectView.frame.origin.y+subjectView.frame.size.height))];
    self.body.delegate=self;
    [messageSubcontainer addSubview:self.body];
    
    //        messageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100);
    messageViewFrame = messageView.frame;
}


-(void) addObervers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

-(UIImage *)randomBG{
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 10, 10);
    layer.backgroundColor = [[UIColor whiteColor]CGColor];
    for (int x = 0; x<10; x++) {
        for (int y = 0; y<10; y++) {
            CALayer *addLayer = [CALayer layer];
            addLayer.frame = CGRectMake(x, y, 1, 1);
            int alphaInt = arc4random()%5+5;
            float alpha = (float)alphaInt/100;
            addLayer.backgroundColor = [[[UIColor blackColor]colorWithAlphaComponent:alpha]CGColor];
            [layer addSublayer:addLayer];
        }
    }
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

-(void)resizeViews{
    topBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, messageView.frame.size.width, 44)];
    gLayer.frame = topBar.bounds;
    self.send.frame  = CGRectMake(topBar.frame.size.width-82, 7, 75, 30);
    self.cancel.frame  = CGRectMake(7, 7, 75, 30);
    messageContainer.frame = CGRectMake(0, topBar.frame.origin.y+topBar.frame.size.height-5, messageView.frame.size.width, messageView.frame.size.height-topBar.frame.size.height-topBar.frame.origin.y+5);
    messageSubcontainer.frame = CGRectMake(10, -5, messageContainer.frame.size.width-20, messageContainer.frame.size.height-5);
    toView.frame = CGRectMake(0, 10, messageSubcontainer.frame.size.width, 30);
    toLabel.frame = CGRectMake(5, 0, 75, toView.frame.size.height);
    self.toTextField.frame = CGRectMake(toLabel.frame.size.width+toLabel.frame.origin.x+5, 0, toView.frame.size.width-toLabel.frame.size.width+toLabel.frame.origin.x-5, toView.frame.size.height);
    toHorizontal.frame = CGRectMake(0, toView.frame.size.height-1, toView.frame.size.width, 1);
    toVertical.frame = CGRectMake(toLabel.frame.size.width+toLabel.frame.origin.x, 0, 1, toView.frame.size.height-0);
    subjectView.frame = CGRectMake(0, toView.frame.origin.y+toView.frame.size.height, messageSubcontainer.frame.size.width, 30);
    subjectLabel.frame = CGRectMake(5, 0, 75, subjectView.frame.size.height);
    self.subjectTextField.frame = CGRectMake(subjectLabel.frame.size.width+subjectLabel.frame.origin.x+5, 0, subjectView.frame.size.width-subjectLabel.frame.size.width+subjectLabel.frame.origin.x-5, subjectView.frame.size.height);
    subjectHorizontal.frame = CGRectMake(0, subjectView.frame.size.height-1, subjectView.frame.size.width, 1);
    subjectVertical.frame = CGRectMake(subjectLabel.frame.size.width+subjectLabel.frame.origin.x, 0, 1, toView.frame.size.height-0);
    self.body.frame = CGRectMake(0, subjectView.frame.origin.y+subjectView.frame.size.height, messageSubcontainer.frame.size.width, messageSubcontainer.frame.size.height-(subjectView.frame.origin.y+subjectView.frame.size.height));
}

-(void)resignResponder{
    [currentTextField resignFirstResponder];
    [currentTextView resignFirstResponder];
}

#pragma mark - UITextView Delegate Methods
-(void)textViewDidBeginEditing:(UITextView *)textView{
    currentTextView = textView;
}


#pragma mark - UITextField Delegate Methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    
    return true;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField==self.fromTextField) {
        [self.toTextField becomeFirstResponder];
    }else if (textField == self.toTextField){
        [self.subjectTextField becomeFirstResponder];
    }else if (textField == self.subjectTextField){
        [self.body becomeFirstResponder];
    }
    
    return true;
}

#pragma mark - Orientation Notification

- (void) didRotate:(NSNotification *)notification
{
    UIDevice *device = [UIDevice currentDevice];
    UIDeviceOrientation orientation = device.orientation;
    
//    NSLog(@"%ld",orientation);
    CGRect superFrame = [[UIScreen mainScreen]bounds];
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        self.frame = CGRectMake(0, 0, superFrame.size.width, superFrame.size.height);
    } else {
        self.frame = CGRectMake(0, 0, superFrame.size.height, superFrame.size.width);
    }
    messageView.frame = CGRectMake(20, 20, self.frame.size.width-40, self.frame.size.height-40);
    messageViewFrame = messageView.frame;
    [self resizeViews];
    iv.frame = self.bounds;
}

#pragma mark - UIKeyboard Notifications

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* userInfo = [aNotification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIDevice *device = [UIDevice currentDevice];
    UIDeviceOrientation orientation = device.orientation;
        [UIView animateWithDuration:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue] animations:^{
            if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
                messageView.frame = CGRectMake(20, 20, self.bounds.size.width-40, self.bounds.size.height-20-kbSize.height);
            } else {
                messageView.frame = CGRectMake(20, 20, self.bounds.size.width-40, self.bounds.size.height-20-kbSize.width);
            }
            
            
            [self resizeViews];
            
        } completion:^(BOOL finished) {
            NSLog(@"%@",messageView);
        }];
        
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
        NSDictionary* userInfo = [aNotification userInfo];
        [UIView animateWithDuration:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue] animations:^{
            messageView.frame = CGRectMake(20, 20, self.bounds.size.width-40, self.bounds.size.height-40);
            [self resizeViews];
        } completion:^(BOOL finished) {
            
        }];
}



@end
