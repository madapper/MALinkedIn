//
//  MALinkedInCommunicationsMessaging.m
//  MALinkedIn
//
//  Created by Paul Napier on 17/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInCommunicationsMessaging.h"

@implementation MALinkedInCommunicationsMessaging


+(void)message:(MALinkedInSession *)session contacts:(NSArray *)contacts delegate:(id)vc
{
    
    MALinkedInCommunicationsMessagingView *comm = [MALinkedInCommunicationsMessagingView new];
//    comm.delegate = vc;
    
    NSMutableArray *addContact = [NSMutableArray new];
    NSString *strTo = @"";
    
    for (int a = 0; a<contacts.count; a++) {
        if ([contacts[a] isKindOfClass:[MALinkedInCommunicationsRecipient class]]) {
            MALinkedInCommunicationsRecipient *recipient = contacts[a];
            if (strTo.length>0) {
                strTo = [strTo stringByAppendingString:@", "];
            }
            
            if (recipient.firstName&&recipient.lastName) {
                if (recipient.uid) {
                    strTo = [strTo stringByAppendingString:[NSString stringWithFormat:@"%@ %@",recipient.firstName,recipient.lastName]];
                    [addContact addObject:recipient];
                }
            }
        }
    }
    comm.toTextField.text = strTo;
    comm.recipients = addContact;
    
    MALinkedInCommunicationsMessaging *message = [MALinkedInCommunicationsMessaging new];
    comm.delegate = message;
    message.session = session;
    
    if (strTo.length>0) {
        [((UIViewController *)vc).view addSubview:comm];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid recipients" message:@"Invalid recipients, please try again. If this problem continues, please contact your administrator" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}



-(void)messagingViewDidSendMessage:(MALinkedInCommunicationsMessagingView *)messagingView{
    
    if (messagingView.subjectTextField.text.length==0||messagingView.body.text.length==0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Subject and body of email, must not be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        
        
        MALinkedInConnectionHandler *handler = [MALinkedInConnectionHandler new];
        handler.delegate = self;
        
//        [handler connectToURL:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/mailbox?oauth2_access_token=%@",self.session.token] post:[self jsonFromMessageView:messagingView] session:self.session];
    }
}

+(void)messageTest:(MALinkedInSession *)session xml:(BOOL)xml{
    MALinkedInCommunicationsMessaging *message = [MALinkedInCommunicationsMessaging new];
    
    MALinkedInConnectionHandler *handler = [MALinkedInConnectionHandler new];
    handler.delegate = message;
    NSString *body = @"";
    if (xml) {
        body = @"<?xml version=\'1.0\' encoding=\'UTF-8\'?><mailbox-item><recipients><recipient><person path=\"/people/6Dto1AcIzw\" /></recipient></recipients><subject>Test 2</subject><body>Test 2</body></mailbox-item>";
    }else{
        body = @"{\"recipients\":{\"values\":[{\"person\":{\"_path\":\"/people/6Dto1AcIzw\"}}]},\"subject\":\"Test 2\",\"body\":\"Test 2\"}";
    }
    
//    [handler connectToURL:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/mailbox?oauth2_access_token=%@",session.token] post:body session:session];
}

-(NSString *)jsonFromMessageView:(MALinkedInCommunicationsMessagingView *)messageView{
    NSMutableDictionary *post = [NSMutableDictionary new];
    
    NSMutableArray *recipients = [NSMutableArray new];
    for (int a = 0; a<messageView.recipients.count; a++) {
        if ([messageView.recipients[a] isKindOfClass:[MALinkedInCommunicationsRecipient class]]) {
            MALinkedInCommunicationsRecipient *recipient = messageView.recipients[a];
            [recipients addObject:@{@"person": @{@"_path": [NSString stringWithFormat:@"/people/%@",recipient.uid]}}];
        }
    }
    [post setObject:@{@"values": recipients} forKey:@"recipients"];
    [post setObject:messageView.subjectTextField.text forKey:@"subject"];
    [post setObject:messageView.body.text forKey:@"body"];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:post
                                                       options:0
                                                         error:&error];
    //    NSLog(@"Json Data: %@",jsonData);
    NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    
    return JSONString;
}

-(NSString *)xmlFromMessageView:(MALinkedInCommunicationsMessagingView *)messageView{
    NSString *post = @"<?xml version='1.0' encoding='UTF-8'?><mailbox-item><recipients>";
    
    for (int a = 0; a<messageView.recipients.count; a++) {
        if ([messageView.recipients[a] isKindOfClass:[MALinkedInCommunicationsRecipient class]]) {
            MALinkedInCommunicationsRecipient *recipient = messageView.recipients[a];
            
            NSString *str = [NSString stringWithFormat:@"<recipient> <person path='/people/%@'/></recipient>",recipient.uid];
            post = [post stringByAppendingString:str];
        }
    }
    post = [post stringByAppendingString:@"</recipients>"];
    post = [post stringByAppendingString:[NSString stringWithFormat:@"<subject>%@</subject>",messageView.subjectTextField.text]];
    post = [post stringByAppendingString:[NSString stringWithFormat:@"<body>%@</body>",messageView.body.text]];
    post = [post stringByAppendingString:@"</mailbox-item>"];
    
    return post;
}

-(void)connectionHandlerDidFinishLoading:(NSObject *)object{
    NSLog(@"%@",object);
}


@end
