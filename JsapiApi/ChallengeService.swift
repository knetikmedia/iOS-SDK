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
public class ChallengeService:NSObject
{
    
    /** Get Artist and Global Videos
    *@param params Dictionary
    *@param callback
    */
    public func getChallenges(params:Dictionary<String,AnyObject>,callback:(Array<Video>,PageRequest,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGES
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=VideoResponse(fromDictionary: result)

                    callback(baseResponse.videos,baseResponse.page,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)

                    callback(baseResponse.videos,baseResponse.page,"",issuccess)
                    
                }
                
        }
    }

 
}