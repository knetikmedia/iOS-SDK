//
//  friendship.swift
//  JsapiApi
//
//  Created by youssef on 3/27/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class FriendshipService :NSObject
{

    /** addFriend.
    *@param params Dictionary{"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    open func addFriend(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
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
    open func getFriends(_ params:Dictionary<String,AnyObject>,callback:@escaping (Friend,String,Bool)->Void)
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
                    callback(friendObject!,"",issuccess)
                }
        }
    }

    
    /** remove User Friend
    *@param params Dictionary {"target_user_id": 0,"user_id": 0}
    *@param callback
    */
    open func removeFriend(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
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
    open func searchFriends(_ params:Dictionary<String,AnyObject>,callback:@escaping (Friend,String,Bool)->Void)
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
                    callback(friendObject!,"",issuccess)
                }
        }
    }

    
    open func facebookFriendsUpdate(_ params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
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
    
    open func addKNEFriendship(_ params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.KNEFRIENDSHIP
        
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

    
    open func deleteKNEFriendship(_ params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.DELETEFRIENDSHIP
        
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
