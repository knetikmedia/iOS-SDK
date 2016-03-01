//
//  friendship.swift
//  JsapiApi
//
//  Created by youssef on 3/27/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class FriendshipService :NSObject
{

    /** addFriend.
    *@param params Dictionary{"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    public func addFriend(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFRIEND
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let friendsResponse=FriendsResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(friendsResponse,friendsResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(friendsResponse,"",issuccess)
                }

        }
    }

    
    /** get User Friends.
    *@param params Dictionary {"page": 0,"limit": 0,"user_id": 0}
    *@param callback
    */
    public func getFriends(params:Dictionary<String,AnyObject>,callback:(Friend,String,Bool)->Void)
    {
        let methodUrl:String = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDS

        JsapiRest.sharedInstance.postrequest(methodUrl , postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let friendsResponse=FriendsResponse(fromDictionary: result)
                let friendObject=friendsResponse.friends
                if(!issuccess)
                {
                    callback(Friend(),friendsResponse.errormessage,issuccess)
                }else
                {
                    callback(friendObject,"",issuccess)
                }
        }
    }

    
    /** remove User Friend
    *@param params Dictionary {"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    public func removeFriend(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REMOVEFRIEND

        JsapiRest.sharedInstance.postrequest(methodUrl , postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let friendsResponse=FriendsResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(friendsResponse,friendsResponse.errormessage,issuccess)

                }else
                {
                    callback(friendsResponse,"",issuccess)
                }
        }
    }

    /** search for a friend
    *@param params Dictionary {"page": 0,"limit": 0,"user_id": 0,"search": ""}
    *@param callback
    */
    public func searchFriends(params:Dictionary<String,AnyObject>,callback:(Friend,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDS
        
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let friendsResponse=FriendsResponse(fromDictionary: result)
                let friendObject=friendsResponse.friends
                if(!issuccess)
                {
                    callback(Friend(),friendsResponse.errormessage,issuccess)
                }else
                {
                    callback(friendObject,"",issuccess)
                }
        }
    }

    
    public func facebookFriendsUpdate(params:Dictionary<String,AnyObject>,callback:(NSDictionary,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.AUTOFRIENDSHIP
        
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let friendsResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(result,friendsResponse.errormessage,issuccess)
                }else
                {
                    callback(result,"",issuccess)
                }
        }
    }

    
}