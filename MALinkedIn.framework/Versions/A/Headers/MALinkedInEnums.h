//
//  MALinkedInEnums.h
//  MALinkedIn
//
//  Created by Paul Napier on 15/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#ifndef MALinkedIn_MALinkedInEnums_h
#define MALinkedIn_MALinkedInEnums_h

typedef enum {
    r_basicprofile,
    r_fullprofile,
    r_emailaddress,
    r_network,
    r_contactinfo,
    rw_nus,
    rw_groups,
    w_messages,
    rw_company_admin
}MALinkedInSessionPermissions;

typedef enum{
    MALinkedInPeopleProfileFieldsDistanceOutOfNetwork = -1,
    MALinkedInPeopleProfileFieldsDistanceMember,
    MALinkedInPeopleProfileFieldsDistance1,
    MALinkedInPeopleProfileFieldsDistance2,
    MALinkedInPeopleProfileFieldsDistance3
}MALinkedInPeopleProfileFieldsDistance;

typedef enum {
    MALinkedInPeopleSearchFieldsNetworkFirst = 100,
    MALinkedInPeopleSearchFieldsNetworkSecond,
    MALinkedInPeopleSearchFieldsNetworkInside,
    MALinkedInPeopleSearchFieldsNetworkOutside
}MALinkedInPeopleSearchFieldsNetwork;

typedef enum {
    MALinkedInPeopleSearchFieldsLanguageEnglish = 200,
    MALinkedInPeopleSearchFieldsLanguageSpanish,
    MALinkedInPeopleSearchFieldsLanguageFrench,
    MALinkedInPeopleSearchFieldsLanguageGerman,
    MALinkedInPeopleSearchFieldsLanguageItalian,
    MALinkedInPeopleSearchFieldsLanguagePortuguese,
    MALinkedInPeopleSearchFieldsLanguageOther
}MALinkedInPeopleSearchFieldsLanguage;

typedef enum {
    MALinkedInSocialNetworkFieldsTypeAPPS,
    MALinkedInSocialNetworkFieldsTypeCMPY,
    MALinkedInSocialNetworkFieldsTypeCONN,
    MALinkedInSocialNetworkFieldsTypeJOBS,
    MALinkedInSocialNetworkFieldsTypeJGRP,
    MALinkedInSocialNetworkFieldsTypePICT,
    MALinkedInSocialNetworkFieldsTypePRFX,
    MALinkedInSocialNetworkFieldsTypeRECU,
    MALinkedInSocialNetworkFieldsTypePRFU,
    MALinkedInSocialNetworkFieldsTypeSHAR,
    MALinkedInSocialNetworkFieldsTypeVIRL,
}MALinkedInSocialNetworkFieldsType;



#endif
