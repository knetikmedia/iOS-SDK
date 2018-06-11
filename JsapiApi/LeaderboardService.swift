//
//  LeaderBoard.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class LeaderboardService:NSObject
{


    open func getWonStateLeaderboards(_ params:Dictionary<String,AnyObject>,callback:@escaping (UserStateResponse,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.WONSTATELEADERBOARD
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            let baseResponse=UserStateResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(UserStateResponse(),baseResponse.errormessage,issuccess)

            }else
            {
                callback(baseResponse,"",issuccess)

            }

        }
    }
    
    /** Get Leaderboards
    */
    
    open func getLeaderboards(_ params:Dictionary<String,AnyObject>,callback:@escaping (Leaderboard,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.LEADERBOARDS
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=LeaderboardResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Leaderboard(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(baseResponse.leaderboard,"",issuccess)
                    
                }
                
        }
    }
    
    
 
    /** Get Strategies
    */
    
    open func getStrategies(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<String>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETSTRATEGIES
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=StrategiesResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.strategies,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(baseResponse.strategies,"",issuccess)
                    
                }
                
        }
    }
    
    
    /** Get User Rank
    */
    
    open func getUserRank(_ params:Dictionary<String,AnyObject>,callback:@escaping (Entrie,String,Bool)->Void)
    {
        let url  = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERRANK
        
        let methodUrl=NSString(format: url as NSString, (params["leaderboard_id"] as?String)!,(params["user_id"] as?String)!)

        JsapiRest.sharedInstance.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=UserRankResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Entrie(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(baseResponse.rank,"",issuccess)
                    
                }
        }
    }


}
