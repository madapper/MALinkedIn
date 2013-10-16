MALinkedIn
==========

This is a framework for working with the LinkedIn API native to iOS. It is a work in progress and currently contains the following APIs:

**People**
-Profile API
-Connections API
-Search API

**Companies**
-Company Lookup API

Future plans are to include the following APIs:

**Groups**
-Groups API

**Jobs**
-Job Lookup API
-Job Search API

**Job Posting**
-Job Posting API

**Share and Social Stream**
-Share API
-Get Network Updates and Statistics API

**Communications**
-Invitation API
-Messaging Between Connections API

The intention is also in improve documentation to ensure easier use.

In order to use this, you will first have to sign into http://developer.linkedin.com and create an application following their guidelines. After this the implementation is simple. Add the libxml2.dylib to your frameworks and drag the MALinkedIn.framework to your project. 

In the header file import this header file <MALinkedIn/MALinkedIn.h>

in the implementation file

MALinkedInSession *session = [MALinkedInSession cachedSession];

	if (!session) {
	
		MALinkedInLogInView *login = [[MALinkedInLogInView alloc]initWithRedirectURL:<your redirect url> clientID:<your app id> clientSecret:<your client secret>];
		
		login.delegate = self;
		
		[self.view addSubview:login];
		
    	}else{
    	
        	[self linkedInViewDidLogIn:session];
        	
    	}
    	


-(void)linkedInViewDidLogIn:(MALinkedInSession *)session{
	
}

Once the user has logged in, you are able to capture the session at any time by calling:

MALinkedInSession *session = [MALinkedInSession sharedSession]

or if the user has closed the application:

MALinkedInSession *session = [MALinkedInSession cachedSession];

The second call will automatically load the sharedSession method.
	
	
