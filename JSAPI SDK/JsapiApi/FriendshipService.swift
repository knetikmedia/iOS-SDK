//
//  friendship.swift
//  JsapiApi
//
//  Created by youssef on 3/27/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class FriendshipService 
{
    public init (){}

    /** addFriend.
    *@param params Dictionary{"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    public func addFriend(myUserId:String ,params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFRIEND,myUserId) as String
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var friendsResponse=FriendsResponse(fromDictionary: result)
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
    public func getFriends(myUserId:String ,params:Dictionary<String,AnyObject>,callback:(Friend,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDS,myUserId) as String

        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var friendsResponse=FriendsResponse(fromDictionary: result)
                var friendObject=friendsResponse.friends
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
    public func removeFriend(myUserId:String,targetUserId:String,params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REMOVEFRIEND,myUserId,targetUserId) as String

        JsapiRest.deleteRequest(methodUrl, deleteParams: Utilities.jsonRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var friendsResponse=FriendsResponse(fromDictionary: result)
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
    public func searchFriends(myUserId:String,params:Dictionary<String,AnyObject>,callback:(Friend,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDS,myUserId) as String
        
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var friendsResponse=FriendsResponse(fromDictionary: result)
                var friendObject=friendsResponse.friends
                if(!issuccess)
                {
                    callback(Friend(),friendsResponse.errormessage,issuccess)
                }else
                {
                    callback(friendObject,"",issuccess)
                }
        }
    }

    
}