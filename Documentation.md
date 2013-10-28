The MALinkedIn framework is designed to be simple to implement. At present the framework only includes methods to call the GET elements of the LinkedIn API from the following LinkedIn API Classes:

**People**
-Profile API
-Connections API
-Search API

**Companies**
-Company Lookup API

**Share and Social Stream**
-Get Network Updates and Statistics API

**Groups**
-Groups API

**Jobs**
-Job Lookup API
-Job Search API

However, work is underway to include all PUT, POST and DELETE methods within all those APIs above as well as the remaining LinkedIn APIs.

Each API above has a separate Class within the framework on which it is possible to call class methods that will work asynchronously and return the resulted data in an NSObject format when complete.


**First Steps**

In order to use this, you will first have to sign into http://developer.linkedin.com and create an application following their guidelines. After this the implementation is simple. Add the libxml2.dylib to your frameworks and drag the MALinkedIn.framework to your project. 

For every class that will be accessing the MALinkedIn framework import MALinkedIn/MALinkedIn.h into the header file.

**Authentication**

When iniially asking the user to login, this is acheived by simply including the below code in the implementation file:
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

Once the user has logged in, you are able to capture the session at any time in any class by calling:
<pre><code>
MALinkedInSession *session = [MALinkedInSession sharedSession]
</code></pre>
or if the user has closed the application:
<pre><code>
MALinkedInSession *session = [MALinkedInSession cachedSession];
</code></pre>
The second call will automatically load the sharedSession method.

**People**
-Profile API
-Connections API
-Search API

**Companies**
-Company Lookup API

**Share and Social Stream**
-Get Network Updates and Statistics API

**Groups**
-Groups API

**Jobs**
-Job Lookup API
-Job Search API

