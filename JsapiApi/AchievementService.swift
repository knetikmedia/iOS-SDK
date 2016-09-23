//
//  Store.swift
//  JsapiApi
//
//  Created by youssef on 3/31/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class AchievementService:NSObject
{
    

    open func getAchievements(_ params:Dictionary<String,AnyObject>,callback:@escaping (AchievementsPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETACHIEVEMENTLIST;
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let pageResponse=AchievementsResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(pageResponse.result,pageResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(pageResponse.result,"",issuccess)
                }
        }
    }
    
    open func getAchievementByName(_ name:String , params:Dictionary<String,AnyObject>,callback:@escaping (Achievements,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETSINGLEACHIEVEMENT
        let methodUrl:String=NSString(format: url as NSString,name) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            let pageResponse=AchievementsSingleResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(Achievements(),pageResponse.errormessage,issuccess)
                
            }else
            {
                callback(pageResponse.content,"",issuccess)
            }
        }
    }

    
    open func getUserAchievements(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (AchievementsPage,String,Bool)->Void)
    {
        let url  = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERACHIEVEMENTLIST
        let methodUrl:String=NSString(format:url as NSString ,userId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            let pageResponse=AchievementsResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(pageResponse.result,pageResponse.errormessage,issuccess)
                
            }else
            {
                callback(pageResponse.result,"",issuccess)
            }
        }
    }

}
