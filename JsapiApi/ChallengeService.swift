//
//  VideoService.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**

*/

import Foundation

open class ChallengeService : NSObject
{
    
    open func getChallenges(_ params:Dictionary<String,AnyObject>,callback:@escaping (ChallengesPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGES
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                if(!issuccess)
                {
                    let baseResponse=BaseChallengeResponse(fromDictionary: result)

                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    let baseResponse=BaseChallengeResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }

  
    open func getChallengeAssets(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<BatchAssetPage>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGESBATCH
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseAssetBatchResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    
                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }
    
    
    open func getChallengeActivityDetails(_ challengeID:String,activityId:String,params:Dictionary<String,AnyObject>,callback:@escaping (ChallengeActivity,String,Bool)->Void)
    {
        
        let url =  JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGEACTIVITYDETAILS
        
        let methodUrl:String=NSString(format: url as NSString ,challengeID,activityId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                

                if(!issuccess)
                {
                    
                   let response =  BaseResponse.init(fromDictionary: result)
                    callback(ChallengeActivity(),response.errormessage,issuccess)
                    
                    
                }else
                {
                    let baseResponse=MainChallengeActiviyResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }
    
    open func getChallengeActivity(_ challengeID:String,params:Dictionary<String,AnyObject>,callback:@escaping (Activities,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGEACTIVITY
        
        let methodUrl:String=NSString(format: url as NSString ,challengeID) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                
                if(!issuccess)
                {
                    
                    let response =  BaseResponse.init(fromDictionary: result)
                    
                    callback(Activities(),response.errormessage,issuccess)
                    
                    
                }else
                {
                    let baseResponse=BaseChallengeActivity(fromDictionary: result)
                    
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }


    
 
}
