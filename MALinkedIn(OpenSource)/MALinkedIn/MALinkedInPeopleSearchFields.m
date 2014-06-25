//
//  MALinkedInPeopleSearchFields.m
//  MALinkedIn
//
//  Created by Paul Napier on 16/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInPeopleSearchFields.h"

@implementation MALinkedInPeopleSearchFields

-(NSString *)getNetwork:(MALinkedInPeopleSearchFieldsNetwork)network{
    NSDictionary *dict = @{
                           @(MALinkedInPeopleSearchFieldsNetworkFirst):@"F",
                           @(MALinkedInPeopleSearchFieldsNetworkSecond):@"S",
                           @(MALinkedInPeopleSearchFieldsNetworkInside):@"A",
                           @(MALinkedInPeopleSearchFieldsNetworkOutside):@"O"
                           };
    return dict[@(network)];
}
-(NSString *)getLanguage:(MALinkedInPeopleSearchFieldsLanguage)language{
    NSDictionary *dict = @{
                           @(MALinkedInPeopleSearchFieldsLanguageEnglish):@"en",
                           @(MALinkedInPeopleSearchFieldsLanguageSpanish):@"es",
                           @(MALinkedInPeopleSearchFieldsLanguageFrench):@"fr",
                           @(MALinkedInPeopleSearchFieldsLanguageGerman):@"de",
                           @(MALinkedInPeopleSearchFieldsLanguageItalian):@"it",
                           @(MALinkedInPeopleSearchFieldsLanguagePortuguese):@"pt",
                           @(MALinkedInPeopleSearchFieldsLanguageOther):@"_o"
                           };
    return dict[@(language)];
}

@end
