The MALinkedIn framework is designed to be simple to implement. At present the framework only includes methods to call the GET elements of the LinkedIn API from the following LinkedIn API Classes:

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

However, work is underway to include all PUT, POST and DELETE methods within all those APIs above as well as the remaining LinkedIn APIs.

Each API above has a separate Class within the framework on which it is possible to call class methods that will work asynchronously and return the resulted data in an NSObject format when complete.


**First Steps**

In order to use this, you will first have to sign into http://developer.linkedin.com and create an application following their guidelines. After this the implementation is simple. Add the libxml2.dylib to your frameworks and drag the MALinkedIn.framework to your project. 

For every class that will be accessing the MALinkedIn framework import <code>&lt;MALinkedIn/MALinkedIn.h&gt;</code> into the header file.

**Authentication**

When initially asking the user to login, this is acheived by simply including the below code in the implementation file:
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

This code willlauch a log in window wit a cover screen that should fit the screen of the device you are working on and prevent the user from accidentally touching the views behind it. This view is not presented modally at this point, but is added as a popover view to the current controller. Future plans are to add the option to have this presented modally as well.

Once the user has logged in, you are able to capture the session at any time in any class by calling:
<pre><code>
MALinkedInSession *session = [MALinkedInSession sharedSession]
</code></pre>
or if the user has closed the application:
<pre><code>
MALinkedInSession *session = [MALinkedInSession cachedSession];
</code></pre>
The second call will automatically load the sharedSession method. 

If for any reason you need to clear the session (such as logging a user out, you are able to do this by calling <code>[MALinkedInSession clearSharedSession];</code>. This wil clearboth the shared session and the cached session from memory.

**People**<br/>
-Profile API<br/>

The People Profile API allows users to get the details about a member on LinkedIn. There are six methods outlined below that allow the currently logged in user to get access to various infromation about the searched for user or themselves.

<pre><code>
+(void)requestMe:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestMe:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleProfileFields *)components completion:(void (^)(NSObject *object))completion;
</code></pre>

For each method a session is required for authentication, which is included in the get request to LinkedIn. In order to use some of these methods the MALinkedInPeopeProfileFields class is required, which can be initatiated as by calling:

<pre><code>
MALinkedInPeopleProfileFields *fields = [MALinkedInPeopleProfileFields new];
</code></pre>

After this is called, the fields can be set, simply by setting their property to true. eg.
<pre><code>
    fields.field_r_basicprofile_id = true;
    fields.field_r_basicprofile_last_name = true;
    fields.field_r_fullprofile_date_of_birth = true;
    fields.field_r_fullprofile_languages = true;
    fields.field_r_fullprofile_interests = true;
</code></pre>

An important item to note, as can be seen from the above example, these are named with the permission required for ease of use. If a field is selected that the current application does not have permission to use, this will be ignored by the framework.

Once the fields in the MALinkedInPeopleProfileFields class have been set, an example method could be called as below:
<pre><code>
    [MALinkedInPeopleProfile requestMe:session components:fields completion:^(NSObject *object) {
        NSLog(@"%@",object);
    }];
</code></pre>

Which would return a dictionary with the relevant information (I have removed my personal information!) :
<pre><code>
    {
    "__name" = person;
    "date-of-birth" =     {
        day = x;
        month = x;
        year = xxxx;
    };
    id = xxxxxxxxxx;
    interests = "xxx";
    languages =     {
        "_total" = 2;
        language =         (
                        {
                id = 13;
                language =                 {
                    name = English;
                };
            },
                        {
                id = 14;
                language =                 {
                    name = Russian;
                };
            }
        );
    };
    "last-name" = xxxxxx;
}

</code></pre>

-Connections API<br/>

The ConnectionsAPI, works to give the user the details about the 1st degree connections of a specified user or themselves. 

<pre><code>
+(void)requestMyConnections:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestMyConnections:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestConnectionsForPersonByID:(NSString *)uid session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session completion:(void (^)(NSObject *object))completion;
+(void)requestConnectionsForPersonByURL:(NSString *)url session:(MALinkedInSession *)session components:(MALinkedInPeopleConnectionsFields *)components completion:(void (^)(NSObject *object))completion;

+(void)requestConnections:(MALinkedInSession *)session new:(BOOL)newConnections modifiedSince:(NSDate *)date completion:(void (^)(NSObject *object))completion;
</code></pre>

As with the Profile API, in order to use some of these methods the class MALinkedInPeopleConnectionsFields, must be initiated and added to the method. This is created in a similarfashion to the MALinkedInPeopleProfileFields class as above.

-Search API<br/>


**Companies**<br/>
-Company Lookup API<br/>

**Share and Social Stream**<br/>
-Get Network Updates and Statistics API<br/>

**Groups**<br/>
-Groups API<br/>

**Jobs**<br/>
-Job Lookup API<br/>
-Job Search API<br/>

