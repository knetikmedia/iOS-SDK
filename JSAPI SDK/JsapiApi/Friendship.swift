//
//  friendship.swift
//  JsapiApi
//
//  Created by youssef on 3/27/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Friendship :NSObject
{
    /** addFriend.
    *@param params Dictionary{"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    public func addFriend(params:Dictionary<String,AnyObject>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFRIEND;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    
    /** get User Friends.
    *@param params Dictionary {"page": 0,"limit": 0,"user_id": 0}
    *@param callback
    */
    public func getFriends(params:Dictionary<String,AnyObject>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDS;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    
    /** remove User Friend
    *@param params Dictionary {"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    public func removeFriend(params:Dictionary<String,AnyObject>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REMOVEFRIEND;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    /** search for a friend
    *@param params Dictionary {"page": 0,"limit": 0,"user_id": 0,"search": ""}
    *@param callback
    */
    public func searchFriends(params:Dictionary<String,AnyObject>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SEARCHFRIEND;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    
}