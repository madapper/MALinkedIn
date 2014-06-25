//
//  MALinkedInJobsSearch.m
//  MALinkedIn
//
//  Created by Paul Napier on 25/10/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MALinkedInJobsSearch.h"
#import "MALinkedInConfiguration.h"

@implementation MALinkedInJobsSearch

+(void)requestJobSearch:(MALinkedInSession *)session parameters:(MALinkedInJobsSearchParameters *)parameters fields:(MALinkedInJobsLookupFields *)fields completion:(void (^)(NSObject *object))completion{
    MALinkedInJobsSearch *search = [MALinkedInJobsSearch new];
    MALinkedInJobsLookup *lookup = [MALinkedInJobsLookup new];
    
    NSString *strLabel = [NSString stringWithFormat:@"request"];
    const char *stringAsChar = [strLabel cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    dispatch_queue_t queue2 = dispatch_queue_create(stringAsChar, NULL);
    
    dispatch_async(queue2, ^(void) {
        
        NSString *strFields = [lookup stringFromFields:fields];
        
        if (strFields.length>0) {
            strFields = [NSString stringWithFormat:@":(jobs%@)",strFields];
        }
        
        NSString *url =[NSString stringWithFormat:@"https://api.linkedin.com/v1/job-search%@?%@&%@",strFields,[search stringFromParamters:parameters],[NSString stringWithFormat:@"oauth2_access_token=%@",session.token]];
        
        MALinkedInConfiguration *config = [MALinkedInConfiguration sharedConfig];
        
        if (config.showURL) NSLog(@"%@",url);
        
        NSObject *returnObject;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (!data) {
            returnObject = @{@"ok": @(false),@"error":[NSString stringWithFormat:@"Invalid data returned from url: %@",url],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]};
        }else{
            XMLDictionaryParser *parser = [[XMLDictionaryParser alloc]init];
            
            NSDictionary *dictJsonData;
            
            NSDictionary *dictXML = [parser dictionaryWithData:data];
            
            NSError *error;
            
            if (dictXML) {
                
                dictJsonData = dictXML;
            }else{
                
                dictJsonData = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:kNilOptions
                                error:&error];
            }
            
            if (dictJsonData) {
                
                returnObject = dictJsonData;
            }else{
                
                returnObject = error;
            }
        }
        
        if (config.showObject) NSLog(@"%@",@{@"object":returnObject,@"object_class":[returnObject class],@"class":[self class],@"method":[NSString stringWithFormat:@"%@" , NSStringFromSelector(_cmd)]});
        
        completion(returnObject);
    });
}



-(NSString *)stringFromParamters:(MALinkedInJobsSearchParameters *)parameters{
    NSString *strFields = @"";
    
    
    if(parameters.param_keywords){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"keywords=%@",[self urlEncodeValue:parameters.param_keywords]]];
    }
    if(parameters.param_company_name){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"company-name=%@",[self urlEncodeValue:parameters.param_company_name]]];
    }
    if(parameters.param_job_title){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"job-title=%@",[self urlEncodeValue:parameters.param_job_title]]];
    }
    if(parameters.param_country_code){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"country-code=%@",[self urlEncodeValue:parameters.param_country_code]]];
    }
    if(parameters.param_postal_code){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"postal-code=%@",[self urlEncodeValue:parameters.param_postal_code]]];
    }
    if(parameters.param_distance>0){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"distance=%d",parameters.param_distance]];
    }
    if(parameters.param_facets){
        NSString *strFacets = [self stringFromFacets:parameters.param_facets];
        
        if (strFields.length>0&&strFacets.length>1) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        if (strFacets.length>1) {
            strFields = [strFields stringByAppendingString:strFacets];
        }
        
    }
    if(parameters.param_start>0){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"start=%d",parameters.param_start]];
    }
    if(parameters.param_count>0){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"count=%d",parameters.param_count]];
    }
    if(parameters.param_sort>0){
        if (strFields.length>0) {
            strFields = [strFields stringByAppendingString:@"&"];
        }
        strFields = [strFields stringByAppendingString:[NSString stringWithFormat:@"distance=%@",[parameters getSort:parameters.param_sort]]];
    }
    
    return strFields;
}

-(NSString *)stringFromFacets:(MALinkedInJobsSearchFacets *)facets{

        NSString *facet = @"";
        NSString *facetFull = @"";
        
        if (facets.facet_company) {
            if (facet.length>0) {
                facet = [facet stringByAppendingString:@","];
            }
            if (facetFull.length>0) {
                facetFull = [facetFull stringByAppendingString:@"&"];
            }
            
            facet = [facet stringByAppendingString:@"company"];
            facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=company,%@",[self urlEncodeValue:facets.facet_company]]];
        }
    
    if (facets.facet_date_posted) {
        if (facet.length>0) {
            facet = [facet stringByAppendingString:@","];
        }
        if (facetFull.length>0) {
            facetFull = [facetFull stringByAppendingString:@"&"];
        }
        
        facet = [facet stringByAppendingString:@"date-posted"];
        facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=date-posted,%@",[self urlEncodeValue:facets.facet_date_posted]]];
    }
    
    if (facets.facet_industry>0) {
        if (facet.length>0) {
            facet = [facet stringByAppendingString:@","];
        }
        if (facetFull.length>0) {
            facetFull = [facetFull stringByAppendingString:@"&"];
        }
        
        facet = [facet stringByAppendingString:@"industry"];
        facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=industry,%@",[self getIndustry:facets.facet_industry]]];
    }
    
    if (facets.facet_job_function) {
        if (facet.length>0) {
            facet = [facet stringByAppendingString:@","];
        }
        if (facetFull.length>0) {
            facetFull = [facetFull stringByAppendingString:@"&"];
        }
        
        facet = [facet stringByAppendingString:@"job-function"];
        facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=job-function,%@",[self urlEncodeValue:facets.facet_job_function]]];
    }
    
    if (facets.facet_location) {
        if (facet.length>0) {
            facet = [facet stringByAppendingString:@","];
        }
        if (facetFull.length>0) {
            facetFull = [facetFull stringByAppendingString:@"&"];
        }
        
        facet = [facet stringByAppendingString:@"location"];
        facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=location,%@",[self urlEncodeValue:facets.facet_location]]];
    }
    
    if (facets.facet_salary) {
        if (facet.length>0) {
            facet = [facet stringByAppendingString:@","];
        }
        if (facetFull.length>0) {
            facetFull = [facetFull stringByAppendingString:@"&"];
        }
        
        facet = [facet stringByAppendingString:@"salary"];
        facetFull = [facetFull stringByAppendingString:[NSString stringWithFormat:@"facet=salary,%@",[self urlEncodeValue:facets.facet_salary]]];
    }
    
    if (facet.length>0) {
        facet = [NSString stringWithFormat:@"facets=%@&",facet];
    }
    
    return [NSString stringWithFormat:@"%@%@",facet,facetFull];
    
}

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}

-(NSString *)getIndustry:(MALinkedInIndustry)industry{
    NSDictionary *dict = @{
                           @(MALinkedInIndustryAccounting):@"47",
                           @(MALinkedInIndustryAirlinesAviation):@"94",
                           @(MALinkedInIndustryAlternativeDisputeResolution):@"120",
                           @(MALinkedInIndustryAlternativeMedicine):@"125",
                           @(MALinkedInIndustryAnimation):@"127",
                           @(MALinkedInIndustryApparelFashion):@"19",
                           @(MALinkedInIndustryArchitecturePlanning):@"50",
                           @(MALinkedInIndustryArtsandCrafts):@"111",
                           @(MALinkedInIndustryAutomotive):@"53",
                           @(MALinkedInIndustryAviationAerospace):@"52",
                           @(MALinkedInIndustryBanking):@"41",
                           @(MALinkedInIndustryBiotechnology):@"12",
                           @(MALinkedInIndustryBroadcastMedia):@"36",
                           @(MALinkedInIndustryBuildingMaterials):@"49",
                           @(MALinkedInIndustryBusinessSuppliesandEquipment):@"138",
                           @(MALinkedInIndustryCapitalMarkets):@"129",
                           @(MALinkedInIndustryChemicals):@"54",
                           @(MALinkedInIndustryCivicSocialOrganization):@"90",
                           @(MALinkedInIndustryCivilEngineering):@"51",
                           @(MALinkedInIndustryCommercialRealEstate):@"128",
                           @(MALinkedInIndustryComputerNetworkSecurity):@"118",
                           @(MALinkedInIndustryComputerGames):@"109",
                           @(MALinkedInIndustryComputerHardware):@"3",
                           @(MALinkedInIndustryComputerNetworking):@"5",
                           @(MALinkedInIndustryComputerSoftware):@"4",
                           @(MALinkedInIndustryConstruction):@"48",
                           @(MALinkedInIndustryConsumerElectronics):@"24",
                           @(MALinkedInIndustryConsumerGoods):@"25",
                           @(MALinkedInIndustryConsumerServices):@"91",
                           @(MALinkedInIndustryCosmetics):@"18",
                           @(MALinkedInIndustryDairy):@"65",
                           @(MALinkedInIndustryDefenseSpace):@"1",
                           @(MALinkedInIndustryDesign):@"99",
                           @(MALinkedInIndustryEducationManagement):@"69",
                           @(MALinkedInIndustryELearning):@"132",
                           @(MALinkedInIndustryElectricalElectronicManufacturing):@"112",
                           @(MALinkedInIndustryEntertainment):@"28",
                           @(MALinkedInIndustryEnvironmentalServices):@"86",
                           @(MALinkedInIndustryEventsServices):@"110",
                           @(MALinkedInIndustryExecutiveOffice):@"76",
                           @(MALinkedInIndustryFacilitiesServices):@"122",
                           @(MALinkedInIndustryFarming):@"63",
                           @(MALinkedInIndustryFinancialServices):@"43",
                           @(MALinkedInIndustryFineArt):@"38",
                           @(MALinkedInIndustryFishery):@"66",
                           @(MALinkedInIndustryFoodBeverages):@"34",
                           @(MALinkedInIndustryFoodProduction):@"23",
                           @(MALinkedInIndustryFundRaising):@"101",
                           @(MALinkedInIndustryFurniture):@"26",
                           @(MALinkedInIndustryGamblingCasinos):@"29",
                           @(MALinkedInIndustryGlassCeramicsConcrete):@"145",
                           @(MALinkedInIndustryGovernmentAdministration):@"75",
                           @(MALinkedInIndustryGovernmentRelations):@"148",
                           @(MALinkedInIndustryGraphicDesign):@"140",
                           @(MALinkedInIndustryHealthWellnessandFitness):@"124",
                           @(MALinkedInIndustryHigherEducation):@"68",
                           @(MALinkedInIndustryHospitalHealthCare):@"14",
                           @(MALinkedInIndustryHospitality):@"31",
                           @(MALinkedInIndustryHumanResources):@"137",
                           @(MALinkedInIndustryImportandExport):@"134",
                           @(MALinkedInIndustryIndividualFamilyServices):@"88",
                           @(MALinkedInIndustryIndustrialAutomation):@"147",
                           @(MALinkedInIndustryInformationServices):@"84",
                           @(MALinkedInIndustryInformationTechnologyandServices):@"96",
                           @(MALinkedInIndustryInsurance):@"42",
                           @(MALinkedInIndustryInternationalAffairs):@"74",
                           @(MALinkedInIndustryInternationalTradeandDevelopment):@"141",
                           @(MALinkedInIndustryInternet):@"6",
                           @(MALinkedInIndustryInvestmentBanking):@"45",
                           @(MALinkedInIndustryInvestmentManagement):@"46",
                           @(MALinkedInIndustryJudiciary):@"73",
                           @(MALinkedInIndustryLawEnforcement):@"77",
                           @(MALinkedInIndustryLawPractice):@"9",
                           @(MALinkedInIndustryLegalServices):@"10",
                           @(MALinkedInIndustryLegislativeOffice):@"72",
                           @(MALinkedInIndustryLeisureTravelTourism):@"30",
                           @(MALinkedInIndustryLibraries):@"85",
                           @(MALinkedInIndustryLogisticsandSupplyChain):@"116",
                           @(MALinkedInIndustryLuxuryGoodsJewelry):@"143",
                           @(MALinkedInIndustryMachinery):@"55",
                           @(MALinkedInIndustryManagementConsulting):@"11",
                           @(MALinkedInIndustryMaritime):@"95",
                           @(MALinkedInIndustryMarketResearch):@"97",
                           @(MALinkedInIndustryMarketingandAdvertising):@"80",
                           @(MALinkedInIndustryMechanicalorIndustrialEngineering):@"135",
                           @(MALinkedInIndustryMediaProduction):@"126",
                           @(MALinkedInIndustryMedicalDevices):@"17",
                           @(MALinkedInIndustryMedicalPractice):@"13",
                           @(MALinkedInIndustryMentalHealthCare):@"139",
                           @(MALinkedInIndustryMilitary):@"71",
                           @(MALinkedInIndustryMiningMetals):@"56",
                           @(MALinkedInIndustryMotionPicturesandFilm):@"35",
                           @(MALinkedInIndustryMuseumsandInstitutions):@"37",
                           @(MALinkedInIndustryMusic):@"115",
                           @(MALinkedInIndustryNanotechnology):@"114",
                           @(MALinkedInIndustryNewspapers):@"81",
                           @(MALinkedInIndustryNonProfitOrganizationManagement):@"100",
                           @(MALinkedInIndustryOilEnergy):@"57",
                           @(MALinkedInIndustryOnlineMedia):@"113",
                           @(MALinkedInIndustryOutsourcingOffshoring):@"123",
                           @(MALinkedInIndustryPackageFreightDelivery):@"87",
                           @(MALinkedInIndustryPackagingandContainers):@"146",
                           @(MALinkedInIndustryPaperForestProducts):@"61",
                           @(MALinkedInIndustryPerformingArts):@"39",
                           @(MALinkedInIndustryPharmaceuticals):@"15",
                           @(MALinkedInIndustryPhilanthropy):@"131",
                           @(MALinkedInIndustryPhotography):@"136",
                           @(MALinkedInIndustryPlastics):@"117",
                           @(MALinkedInIndustryPoliticalOrganization):@"107",
                           @(MALinkedInIndustryPrimarySecondaryEducation):@"67",
                           @(MALinkedInIndustryPrinting):@"83",
                           @(MALinkedInIndustryProfessionalTrainingCoaching):@"105",
                           @(MALinkedInIndustryProgramDevelopment):@"102",
                           @(MALinkedInIndustryPublicPolicy):@"79",
                           @(MALinkedInIndustryPublicRelationsandCommunications):@"98",
                           @(MALinkedInIndustryPublicSafety):@"78",
                           @(MALinkedInIndustryPublishing):@"82",
                           @(MALinkedInIndustryRailroadManufacture):@"62",
                           @(MALinkedInIndustryRanching):@"64",
                           @(MALinkedInIndustryRealEstate):@"44",
                           @(MALinkedInIndustryRecreationalFacilitiesandServices):@"40",
                           @(MALinkedInIndustryReligiousInstitutions):@"89",
                           @(MALinkedInIndustryRenewablesEnvironment):@"144",
                           @(MALinkedInIndustryResearch):@"70",
                           @(MALinkedInIndustryRestaurants):@"32",
                           @(MALinkedInIndustryRetail):@"27",
                           @(MALinkedInIndustrySecurityandInvestigations):@"121",
                           @(MALinkedInIndustrySemiconductors):@"7",
                           @(MALinkedInIndustryShipbuilding):@"58",
                           @(MALinkedInIndustrySportingGoods):@"20",
                           @(MALinkedInIndustrySports):@"33",
                           @(MALinkedInIndustryStaffingandRecruiting):@"104",
                           @(MALinkedInIndustrySupermarkets):@"22",
                           @(MALinkedInIndustryTelecommunications):@"8",
                           @(MALinkedInIndustryTextiles):@"60",
                           @(MALinkedInIndustryThinkTanks):@"130",
                           @(MALinkedInIndustryTobacco):@"21",
                           @(MALinkedInIndustryTranslationandLocalization):@"108",
                           @(MALinkedInIndustryTransportationTruckingRailroad):@"92",
                           @(MALinkedInIndustryUtilities):@"59",
                           @(MALinkedInIndustryVentureCapitalPrivateEquity):@"106",
                           @(MALinkedInIndustryVeterinary):@"16",
                           @(MALinkedInIndustryWarehousing):@"93",
                           @(MALinkedInIndustryWholesale):@"133",
                           @(MALinkedInIndustryWineandSpirits):@"142",
                           @(MALinkedInIndustryWireless):@"119",
                           @(MALinkedInIndustryWritingandEditing):@"103",
                           };
    return dict[@(industry)];
}

@end
