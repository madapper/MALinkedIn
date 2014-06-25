//
//  MALinkedInLogInView.m
//  TestLinkedIn
//
//  Created by Paul Napier on 9/10/13.
//  Copyright (c) 2013 We Are Social. All rights reserved.
//

#import "MALinkedInLogInView.h"

@implementation MALinkedInLogInView

+(void)initWithDelegate:(NSObject<MALinkedInViewDelegate> *)vc redirectURL:(NSString *)redirectURL clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret{
    MALinkedInLogInView *view = [[MALinkedInLogInView alloc]initWithRedirectURL:redirectURL clientID:clientID clientSecret:clientSecret];
    view.delegate = vc;
    [((UIViewController *)vc).view addSubview:view];
}

-(id)initWithRedirectURL:(NSString *)redirectURL clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret{
    
    
    self = [super init];
    if (self) {
        permissions = [NSMutableArray new];
        
        CGRect superFrame = [[UIScreen mainScreen]bounds];
        //        self.backgroundColor = [UIColor redColor];
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
            self.frame = CGRectMake(0, 0, superFrame.size.width, superFrame.size.height);
        } else {
            self.frame = CGRectMake(0, 0, superFrame.size.height, superFrame.size.width);
        }
        
        self.clientID = clientID;
        self.clientSecret = clientSecret;
        self.redirectURL = redirectURL;
        
        
        iv = [UIButton buttonWithType:UIButtonTypeCustom];
        iv.frame = self.bounds;
        iv.backgroundColor = [UIColor colorWithWhite:0.667 alpha:0.300];
        [iv addTarget:self action:@selector(resignResponder) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iv];
        
        
        wv = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 450, 240)];
        [self addSubview:wv];
        wv.delegate = self;
        
        wv.scrollView.scrollEnabled = false;
        //        wv.alpha = 0;
        [wv loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=%@&state=abcdefghijklmnopqrstuvwxyz&redirect_uri=%@",self.clientID,self.redirectURL]]]];
        
        [self createLoginView];
        [self createBlurView];
        
        [self performSelector:@selector(addObervers) withObject:nil afterDelay:0.05];
        //        NSLog(@"%@",action.subviews);
        
    }
    return self;
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

-(void)createBlurView{
    blurView = [[AMBlurView alloc]initWithFrame:CGRectMake(0, 0, loginView.frame.size.width, loginView.frame.size.height)];
    [loginView insertSubview:blurView belowSubview:topBanner];
    
    blurView.layer.cornerRadius = 5;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = blurView.bounds;
    [indicator startAnimating];
    [blurView addSubview:indicator];
}

-(void)createLoginView{
    loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    [self addSubview:loginView];
    
    
    topBanner = [[UIView alloc]initWithFrame:CGRectMake(0, 0, loginView.frame.size.width, 44)];
    
    CAGradientLayer *gLayer = [CAGradientLayer layer];
    gLayer.frame = topBanner.bounds;
    gLayer.colors = @[
                      (id)[[UIColor colorWithRed:0.965 green:0.956 blue:0.941 alpha:1.000]CGColor],
                      (id)[[UIColor colorWithRed:0.723 green:0.705 blue:0.687 alpha:1.000]CGColor],
                      ];
    
    [topBanner.layer addSublayer:gLayer];
    
    [loginView addSubview:topBanner];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 123, 30)];
    logo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://dlc1-s.licdn.com/sites/default/files/Logo-41px-R.png"]]];//[UIImage imageNamed:@"linkedin"];
    logo.center = CGPointMake(topBanner.frame.size.width/2, topBanner.frame.size.height/2);
    [topBanner addSubview:logo];
    
    
    container = [[UIView alloc]initWithFrame:CGRectMake(0, topBanner.frame.origin.y+topBanner.frame.size.height-5, loginView.frame.size.width, loginView.frame.size.height-topBanner.frame.size.height-topBanner.frame.origin.y+5)];
    container.layer.cornerRadius = 5;
    container.clipsToBounds = true;
    
    container.backgroundColor = [UIColor colorWithPatternImage:[self randomBG]];
    container.layer.borderColor = [[UIColor colorWithWhite:0.667 alpha:0.500]CGColor];
    container.layer.borderWidth = 1;
    [loginView insertSubview:container belowSubview:topBanner];
    //        [loginView addSubview:container];
    
    info = [[UIView alloc]initWithFrame:CGRectMake(10, 0, container.frame.size.width-20, 85)];
    info.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    
    requestLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, info.frame.size.width-20, info.frame.size.height)];
    requestLabel.numberOfLines = 5;
    requestLabel.textAlignment = NSTextAlignmentCenter;
    requestLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    requestLabel.backgroundColor = [UIColor clearColor];
    [info addSubview:requestLabel];
    
    [container addSubview:info];
    
    action = [[UIView alloc]initWithFrame:CGRectMake(10, info.frame.size.height+info.frame.origin.y-5, container.frame.size.width-20, container.frame.size.height-info.frame.size.height+5-10)];
    action.layer.cornerRadius = 5;
    action.backgroundColor = [UIColor colorWithWhite:0.151 alpha:1.000];
    [container insertSubview:action belowSubview:info];
    //        [container addSubview:action];
    
    textFields = [[UIView alloc]initWithFrame:CGRectMake(10, 15, action.frame.size.width-20, 81)];
    textFields.backgroundColor = [UIColor whiteColor];
    textFields.layer.cornerRadius = 5;
    [action addSubview:textFields];
    
    username = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, textFields.frame.size.width-20, 40)];
    username.placeholder = @"Email";
    username.delegate = self;
    [textFields addSubview:username];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 40, textFields.frame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithWhite:0.835 alpha:1.000];
    [textFields addSubview:line];
    
    password = [[UITextField alloc]initWithFrame:CGRectMake(10, 41, textFields.frame.size.width-20, 40)];
    password.placeholder = @"Password";
    password.clearsOnBeginEditing = true;
    password.rightViewMode = true;
    password.delegate = self;
    password.secureTextEntry = YES;
    [textFields addSubview:password];
    
    
    allow = [UIButton buttonWithType:UIButtonTypeCustom];
    allow.frame  = CGRectMake(10, textFields.frame.size.height+textFields.frame.origin.y+10, action.frame.size.width/2-15, 44);
    [action addSubview:allow];
    [allow setTitle:@"Allow" forState:UIControlStateNormal];
    [allow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [allow setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    CAGradientLayer *gLayer2 = [CAGradientLayer layer];
    gLayer2.frame = allow.bounds;
    gLayer2.colors = @[
                       (id)[[UIColor colorWithRed:0.124 green:0.400 blue:0.659 alpha:1.000]CGColor],
                       (id)[[UIColor colorWithRed:0.108 green:0.299 blue:0.483 alpha:1.000]CGColor],
                       ];
    gLayer2.cornerRadius = 3;
    [allow.layer addSublayer:gLayer2];
    allow.layer.cornerRadius = 3;
    
    [allow addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
    cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame  = CGRectMake(allow.frame.origin.x+allow.frame.size.width+10, textFields.frame.size.height+textFields.frame.origin.y+10, action.frame.size.width/2-15, 44);
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [action addSubview:cancel];
    CAGradientLayer *gLayer3 = [CAGradientLayer layer];
    gLayer3.frame = allow.bounds;
    gLayer3.colors = @[
                       (id)[[UIColor colorWithWhite:0.926 alpha:1.000]CGColor],
                       (id)[[UIColor colorWithWhite:0.779 alpha:1.000]CGColor],
                       ];
    gLayer3.cornerRadius = 3;
    [cancel.layer addSublayer:gLayer3];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = true;
    
    action.frame = CGRectMake(action.frame.origin.x, action.frame.origin.y, action.frame.size.width, cancel.frame.origin.y+cancel.frame.size.height+10);
    container.frame = CGRectMake(container.frame.origin.x, container.frame.origin.y, container.frame.size.width, action.frame.origin.y+action.frame.size.height+10);
    loginView.frame = CGRectMake(loginView.frame.origin.x, loginView.frame.origin.y, loginView.frame.size.width, container.frame.size.height+container.frame.origin.y);
    
    loginView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100);
    loginViewFrame = loginView.frame;
    
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

-(void)resignResponder{
    [currentTextField resignFirstResponder];
}

-(void)submit{
    [wv stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('session_key-oauth2SAuthorizeForm').value = '%@'",username.text]];
    [wv stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('session_password-oauth2SAuthorizeForm').value = '%@'",password.text]];
    
    if (username.text.length<3) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Email must be greater than 3 characters" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else if (password.text.length<6){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Password must be greater than 6 characters" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else if ([username.text rangeOfString:@"@"].location>username.text.length){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        [UIView animateWithDuration:0.35 animations:^{
            blurView.alpha = 1;
        }];
        [wv stringByEvaluatingJavaScriptFromString:@"document.forms['oauth2SAuthorizeForm'].submit()"];
    }
}


#pragma mark - UITextField Delegate Methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    
    return true;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField==username) {
        [password becomeFirstResponder];
    }else if(textField==password){
        [self submit];
        [password resignFirstResponder];
    }
    
    return true;
}

#pragma mark - UIWebView Delegate methods

-(void)webViewDidStartLoad:(UIWebView *)webView{
    //    NSString *url = [NSString stringWithFormat:@"%@",webView.request.URL];
    //    if ([url rangeOfString:self.redirectURL].location>0&&[url rangeOfString:self.redirectURL].location<url.length) {
    //        [UIView beginAnimations:Nil context:NULL];
    //        self.alpha = 1;
    //        [UIView commitAnimations];
    //    }
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *html =[webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    if (!initailLoadDone) {
        NSArray *arr = [self parseHTMLfromData:data queryString:@"//i"];
        
        NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        
        NSString *request = [NSString stringWithFormat:@"%@ would like to access",appName];
        int a = 0;
        for (TFHppleElement *element in arr) {
            
            NSString *requested = [[[element attributes]objectForKey:@"title"]lowercaseString];
            [permissions addObject:requested];
            if (a>0) {
                request = [request stringByAppendingString:@","];
            }
            request = [request stringByAppendingString:[NSString stringWithFormat:@" %@",requested]];
            a++;
        }
//        NSLog(@"%@",permissions);
        request = [request stringByAppendingString:@"."];
        
        [UIView animateWithDuration:0.35 animations:^{
            blurView.alpha = 0;
        }];
        requestLabel.text = request;
        
        float size = 3.0/(float)request.length;
        
        int increase = 209-(int)request.length;
        
        requestLabel.font = [UIFont fontWithName:@"Helvetica" size:12+(size * increase)];
        //        NSLog(@"%@",request);
    }else if ([html rangeOfString:@"We need to verify you're not a robot! Please complete this security check:"].location<html.length){
        wv.center = loginView.center;
        wv.alpha = 1;
        loginView.alpha = 0;
        
    }else{
        NSArray *error = [self parseHTMLfromData:data queryString:@"//div[@class='alert error']/p/strong"];
        if (error.count>0) {
            TFHppleElement *element = error[0];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:[[element firstChild]content] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [UIView animateWithDuration:0.35 animations:^{
                blurView.alpha = 0;
            }];
        }else{
//            NSLog(@"Error? %@",webView.request);
            [UIView animateWithDuration:0.35 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
    }
    initailLoadDone = true;
}



-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    NSLog(@"%@",request.URL);
    wv.alpha = 0;
    loginView.alpha = 1;
    if (initailLoadDone) {
        


        NSURL *url = request.URL;
        NSString *urlString = url.absoluteString;

//        NSString *url = [NSString stringWithFormat:@"%@",webView.request.URL];
        
        if ([urlString rangeOfString:self.redirectURL].location==0) {

        BOOL userAllowedAccess = ([urlString rangeOfString:@"user_refused"].location == NSNotFound);
        if ( userAllowedAccess )
        {
            
            
            if (!receivedOAuth) {
                receivedOAuth = true;
                
                request_token = [urlString substringWithRange:NSMakeRange(self.redirectURL.length+7, [urlString rangeOfString:@"&state="].location-self.redirectURL.length-7)];
                
                receivedOAuth = true;
                request_token = [urlString substringWithRange:NSMakeRange(self.redirectURL.length+7, [urlString rangeOfString:@"&state="].location-self.redirectURL.length-7)];
                
                MALinkedInConnectionHandler *linkedIn = [MALinkedInConnectionHandler new];
                linkedIn.delegate=self;
                [linkedIn connectToURL:@"https://www.linkedin.com/uas/oauth2/accessToken" post:[NSString stringWithFormat:@"grant_type=authorization_code"
                                                                                                "&code=%@"
                                                                                                "&redirect_uri=%@"
                                                                                                "&client_id=%@"
                                                                                                "&client_secret=%@",request_token,self.redirectURL,self.clientID,self.clientSecret]];
            }
        }
        else
        {
            NSLog(@"user refused");
            [UIView animateWithDuration:0.35 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
        
            
        }
    }
    return true;
}




-(void)connectionHandlerDidFinishLoading:(NSObject *)object{
    receivedOAuth = false;
    
    NSDictionary *dict = (NSDictionary *)object;
    NSDate *now = [NSDate date];
    int daysToAdd = 59;
    NSDate *newDate1 = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    MALinkedInSession *session = [MALinkedInSession sharedSession];
    session.token = dict[@"access_token"];
    session.expiry = newDate1;
    session.permissions = permissions;
    session.requestToken = request_token;
//    NSLog(@"request token = %@",request_token);
    session.redirectURL = self.redirectURL;
    session.clientID = self.clientID;
//    NSLog(@"Client ID = %@",self.clientID);
    session.clientSecret = self.clientSecret;
//    NSLog(@"Shared Session: %@",session.token);
    
    
    
    if ([self.delegate respondsToSelector:@selector(linkedInViewDidLogIn:)]) {
        [self.delegate linkedInViewDidLogIn:session];
    }
    
    [session cache];
    
}

#pragma mark - TFHPPL Methods

-(NSArray *)parseHTMLfromData:(NSData *)data queryString:(NSString *)queryString{
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:data];
    return [tutorialsParser searchWithXPathQuery:queryString];
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
        loginView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100);
    } else {
        self.frame = CGRectMake(0, 0, superFrame.size.height, superFrame.size.width);
        if (device.userInterfaceIdiom==UIUserInterfaceIdiomPhone) {
            loginView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        }else{
            loginView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100);
            
        }
    }
    loginViewFrame = loginView.frame;
    
    iv.frame = self.bounds;
    
    
}

#pragma mark - UIKeyboard Notifications

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* userInfo = [aNotification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    keyboardSize = kbSize;
        CGRect posInWindow = [loginView.superview convertRect:loginView.frame toView:nil];
        float bottom = posInWindow.origin.y+posInWindow.size.height;
        if (bottom>self.frame.size.height-keyboardSize.height) {
            [UIView animateWithDuration:0.35 animations:^{
                    loginView.frame = CGRectMake(loginView.frame.origin.x, loginView.frame.origin.y-74, loginView.frame.size.width, loginView.frame.size.height);
            } completion:^(BOOL finished) {
                
            }];
            
        }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    if (loginView.frame.origin.y!=loginViewFrame.origin.y) {
        loginView.frame = loginViewFrame;
    }
}

@end
