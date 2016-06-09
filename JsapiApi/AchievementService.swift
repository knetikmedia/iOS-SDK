//
//  Store.swift
//  JsapiApi
//
//  Created by youssef on 3/31/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class AchievementService:NSObject
{
    

    public func getAchievements(params:Dictionary<String,AnyObject>,callback:(AchievementsPage,String,Bool)->Void)
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
    
    public func getAchievementByName(name:String , params:Dictionary<String,AnyObject>,callback:(Achievements,String,Bool)->Void)
    {

        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETSINGLEACHIEVEMENT,name) as String

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

    
    public func getUserAchievements(userId:String,params:Dictionary<String,AnyObject>,callback:(AchievementsPage,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERACHIEVEMENTLIST,userId) as String

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