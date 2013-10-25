MALinkedIn
==========

This is a framework for working with the LinkedIn API native to iOS7. Currently previous versions of iOS are not supported, but this is a feature that is planned :). It is a work in progress and currently contains the following APIs:

**People**<br/>
-Profile API<br/>
-Connections API<br/>
-Search API

**Companies**<br/>
-Company Lookup API

**Share and Social Stream**<br/>
-Get Network Updates and Statistics API

**Groups**<br/>
-Groups API - GET only

**Jobs**<br/>
-Job Lookup API<br/>
-Job Search API

**Future plans are to include the following APIs:**

**Groups**<br/>
-Groups API - PUT, POST and DELETE

**Job Posting**<br/>
-Job Posting API

**Share and Social Stream**<br/>
-Share API<br/>

**Communications**<br/>
-Invitation API<br/>
-Messaging Between Connections API

The intention is also in improve documentation to ensure easier use.

In order to use this, you will first have to sign into http://developer.linkedin.com and create an application following their guidelines. After this the implementation is simple. Add the libxml2.dylib to your frameworks and drag the MALinkedIn.framework to your project. 

In the header file import MALinkedIn/MALinkedIn.h

In the implementation file:
<pre><code>
MALinkedInSession *session = [MALinkedInSession cachedSession];
	if (!session.token) {
		MALinkedInLogInView *login = [[MALinkedInLogInView alloc]initWithRedirectURL:<your redirect url> clientID:<your app id> clientSecret:<your client secret>];
		login.delegate = self;
		[self.view addSubview:login];
    	}else{
        	[self linkedInViewDidLogIn:session];
    	}


-(void)linkedInViewDidLogIn:(MALinkedInSession *)session{
	
}
</code></pre>

Once the user has logged in, you are able to capture the session at any time by calling:
<pre><code>
MALinkedInSession *session = [MALinkedInSession sharedSession]
</code></pre>
or if the user has closed the application:
<pre><code>
MALinkedInSession *session = [MALinkedInSession cachedSession];
</code></pre>
The second call will automatically load the sharedSession method.
	
	
