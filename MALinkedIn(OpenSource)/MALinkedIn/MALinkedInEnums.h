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

typedef enum{
    MALinkedInGroupsParametersOrderRecency = 300,
    MALinkedInGroupsParametersOrderPopularity,
}MALinkedInGroupsParametersOrder;

typedef enum{
    MALinkedInGroupsParametersRoleCreator= 400,
    MALinkedInGroupsParametersRoleCommenter,
    MALinkedInGroupsParametersRoleFollower,
}MALinkedInGroupsParametersRole;

typedef enum{
    MALinkedInGroupsParametersCategoryDiscussion = 500,
}MALinkedInGroupsParametersCategory;

typedef enum {
    MALinkedInJobsSearchFieldsRelationship = 600,
    MALinkedInJobsSearchFieldsDatePostedAsc,
    MALinkedInJobsSearchFieldsDatePostedDesc,
}MALinkedInJobsSearchFieldsSort;

typedef enum {
    MALinkedInIndustryAccounting = 700,
    MALinkedInIndustryAirlinesAviation,
    MALinkedInIndustryAlternativeDisputeResolution,
    MALinkedInIndustryAlternativeMedicine,
    MALinkedInIndustryAnimation,
    MALinkedInIndustryApparelFashion,
    MALinkedInIndustryArchitecturePlanning,
    MALinkedInIndustryArtsandCrafts,
    MALinkedInIndustryAutomotive,
    MALinkedInIndustryAviationAerospace,
    MALinkedInIndustryBanking,
    MALinkedInIndustryBiotechnology,
    MALinkedInIndustryBroadcastMedia,
    MALinkedInIndustryBuildingMaterials,
    MALinkedInIndustryBusinessSuppliesandEquipment,
    MALinkedInIndustryCapitalMarkets,
    MALinkedInIndustryChemicals,
    MALinkedInIndustryCivicSocialOrganization,
    MALinkedInIndustryCivilEngineering,
    MALinkedInIndustryCommercialRealEstate,
    MALinkedInIndustryComputerNetworkSecurity,
    MALinkedInIndustryComputerGames,
    MALinkedInIndustryComputerHardware,
    MALinkedInIndustryComputerNetworking,
    MALinkedInIndustryComputerSoftware,
    MALinkedInIndustryConstruction,
    MALinkedInIndustryConsumerElectronics,
    MALinkedInIndustryConsumerGoods,
    MALinkedInIndustryConsumerServices,
    MALinkedInIndustryCosmetics,
    MALinkedInIndustryDairy,
    MALinkedInIndustryDefenseSpace,
    MALinkedInIndustryDesign,
    MALinkedInIndustryEducationManagement,
    MALinkedInIndustryELearning,
    MALinkedInIndustryElectricalElectronicManufacturing,
    MALinkedInIndustryEntertainment,
    MALinkedInIndustryEnvironmentalServices,
    MALinkedInIndustryEventsServices,
    MALinkedInIndustryExecutiveOffice,
    MALinkedInIndustryFacilitiesServices,
    MALinkedInIndustryFarming,
    MALinkedInIndustryFinancialServices,
    MALinkedInIndustryFineArt,
    MALinkedInIndustryFishery,
    MALinkedInIndustryFoodBeverages,
    MALinkedInIndustryFoodProduction,
    MALinkedInIndustryFundRaising,
    MALinkedInIndustryFurniture,
    MALinkedInIndustryGamblingCasinos,
    MALinkedInIndustryGlassCeramicsConcrete,
    MALinkedInIndustryGovernmentAdministration,
    MALinkedInIndustryGovernmentRelations,
    MALinkedInIndustryGraphicDesign,
    MALinkedInIndustryHealthWellnessandFitness,
    MALinkedInIndustryHigherEducation,
    MALinkedInIndustryHospitalHealthCare,
    MALinkedInIndustryHospitality,
    MALinkedInIndustryHumanResources,
    MALinkedInIndustryImportandExport,
    MALinkedInIndustryIndividualFamilyServices,
    MALinkedInIndustryIndustrialAutomation,
    MALinkedInIndustryInformationServices,
    MALinkedInIndustryInformationTechnologyandServices,
    MALinkedInIndustryInsurance,
    MALinkedInIndustryInternationalAffairs,
    MALinkedInIndustryInternationalTradeandDevelopment,
    MALinkedInIndustryInternet,
    MALinkedInIndustryInvestmentBanking,
    MALinkedInIndustryInvestmentManagement,
    MALinkedInIndustryJudiciary,
    MALinkedInIndustryLawEnforcement,
    MALinkedInIndustryLawPractice,
    MALinkedInIndustryLegalServices,
    MALinkedInIndustryLegislativeOffice,
    MALinkedInIndustryLeisureTravelTourism,
    MALinkedInIndustryLibraries,
    MALinkedInIndustryLogisticsandSupplyChain,
    MALinkedInIndustryLuxuryGoodsJewelry,
    MALinkedInIndustryMachinery,
    MALinkedInIndustryManagementConsulting,
    MALinkedInIndustryMaritime,
    MALinkedInIndustryMarketResearch,
    MALinkedInIndustryMarketingandAdvertising,
    MALinkedInIndustryMechanicalorIndustrialEngineering,
    MALinkedInIndustryMediaProduction,
    MALinkedInIndustryMedicalDevices,
    MALinkedInIndustryMedicalPractice,
    MALinkedInIndustryMentalHealthCare,
    MALinkedInIndustryMilitary,
    MALinkedInIndustryMiningMetals,
    MALinkedInIndustryMotionPicturesandFilm,
    MALinkedInIndustryMuseumsandInstitutions,
    MALinkedInIndustryMusic,
    MALinkedInIndustryNanotechnology,
    MALinkedInIndustryNewspapers,
    MALinkedInIndustryNonProfitOrganizationManagement,
    MALinkedInIndustryOilEnergy,
    MALinkedInIndustryOnlineMedia,
    MALinkedInIndustryOutsourcingOffshoring,
    MALinkedInIndustryPackageFreightDelivery,
    MALinkedInIndustryPackagingandContainers,
    MALinkedInIndustryPaperForestProducts,
    MALinkedInIndustryPerformingArts,
    MALinkedInIndustryPharmaceuticals,
    MALinkedInIndustryPhilanthropy,
    MALinkedInIndustryPhotography,
    MALinkedInIndustryPlastics,
    MALinkedInIndustryPoliticalOrganization,
    MALinkedInIndustryPrimarySecondaryEducation,
    MALinkedInIndustryPrinting,
    MALinkedInIndustryProfessionalTrainingCoaching,
    MALinkedInIndustryProgramDevelopment,
    MALinkedInIndustryPublicPolicy,
    MALinkedInIndustryPublicRelationsandCommunications,
    MALinkedInIndustryPublicSafety,
    MALinkedInIndustryPublishing,
    MALinkedInIndustryRailroadManufacture,
    MALinkedInIndustryRanching,
    MALinkedInIndustryRealEstate,
    MALinkedInIndustryRecreationalFacilitiesandServices,
    MALinkedInIndustryReligiousInstitutions,
    MALinkedInIndustryRenewablesEnvironment,
    MALinkedInIndustryResearch,
    MALinkedInIndustryRestaurants,
    MALinkedInIndustryRetail,
    MALinkedInIndustrySecurityandInvestigations,
    MALinkedInIndustrySemiconductors,
    MALinkedInIndustryShipbuilding,
    MALinkedInIndustrySportingGoods,
    MALinkedInIndustrySports,
    MALinkedInIndustryStaffingandRecruiting,
    MALinkedInIndustrySupermarkets,
    MALinkedInIndustryTelecommunications,
    MALinkedInIndustryTextiles,
    MALinkedInIndustryThinkTanks,
    MALinkedInIndustryTobacco,
    MALinkedInIndustryTranslationandLocalization,
    MALinkedInIndustryTransportationTruckingRailroad,
    MALinkedInIndustryUtilities,
    MALinkedInIndustryVentureCapitalPrivateEquity,
    MALinkedInIndustryVeterinary,
    MALinkedInIndustryWarehousing,
    MALinkedInIndustryWholesale,
    MALinkedInIndustryWineandSpirits,
    MALinkedInIndustryWireless,
    MALinkedInIndustryWritingandEditing,
}MALinkedInIndustry;


#endif
