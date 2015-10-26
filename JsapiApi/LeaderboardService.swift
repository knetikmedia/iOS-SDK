//
//  LeaderBoard.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class LeaderboardService:NSObject
{
    
    /** Get Leaderboards
    *@param params Dictionary
    *@param callback
    */
    
    public func getLeaderboards(params:Dictionary<String,AnyObject>,callback:(Leaderboard,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.LEADERBOARDS
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=LeaderboardResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Leaderboard(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.leaderboard,"",issuccess)
                    
                }
                
        }
    }
 
    /** Get Strategies
    *@param params Dictionary
    *@param callback
    */
    
    public func getStrategies(params:Dictionary<String,AnyObject>,callback:(Array<String>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETSTRATEGIES
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=StrategiesResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.strategies,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.strategies,"",issuccess)
                    
                }
                
        }
    }
    
    
    /** Get User Rank
    *@param params Dictionary {leaderboardId:1,userId:1}
    *@param callback
    */
    
    public func getUserRank(params:Dictionary<String,AnyObject>,callback:(Entrie,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERRANK, (params["leaderboardId"] as?String)!,(params["userId"] as?String)!)

        JsapiRest.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=UserRankResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Entrie(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.rank,"",issuccess)
                    
                }
        }
    }


}