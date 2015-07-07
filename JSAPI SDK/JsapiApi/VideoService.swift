//
//  VideoService.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**

class var GETVIDEOS:String {return "/services/latest/videos"}
class var GETUSERVIDEOS:String {return "/services/latest/users/%@/videos"} // %@  userID
class var GETMYFAVORITEVIDEOS:String {return "/services/latest/users/%@/videos/favorited"} //%@ userID
class var GETFRIENDSVIDEO:String {return "/services/latest/friends/videos"}
class var ADDVIDEO:String {return "/services/latest/videos"}
class var UPDATEVIDEODETAILS:String {return "/services/latest/videos/%@/details"} //videoID
class var ADDUSERUPLOADEDMEDIAITEMASSESTS:String {return "/services/latest/videos/assets"}
*/

import Foundation
public class VideoService
{
    public init () {}
    
    /** Get Artist and Global Videos
    *@param params Dictionary
    *@param callback
    */
    public func getVideos(params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETVIDEOS
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=VideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    println(result)
                    callback(baseResponse.videos,"",issuccess)
                    
                }
                
        }
    }

    /** Get Artist and Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    public func getUserVideos(userId:String,params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETVIDEOS,userId) as String
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=VideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    println(result)
                    callback(baseResponse.videos,"",issuccess)
                    
                }
                
        }
    }
    
    
    /** Get Favorites Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    public func getMyFavoritesVideos(userId:String,params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETMYFAVORITESVIDEOS,userId) as String
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=VideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    println(result)
                    callback(baseResponse.videos,"",issuccess)
                    
                }
                
        }
    }

    /** Get Friends Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    public func getFriendsVideos(params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDSVIDEO
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=VideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                }else
                {
                    println(result)
                    callback(baseResponse.videos,"",issuccess)
                }
                
        }
    }
    
    
    /** Add User Video
    *@param params Dictionary
    *@param callback
    */
    public func addVideo(params:Dictionary<String,AnyObject>,callback:(NewVideo,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDVIDEO
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(NewVideo(),baseResponse.errormessage,issuccess)
                }else
                {
                    println(result)
                    callback(baseResponse.video,"",issuccess)
                }
                
        }
    }

    /** Add User Video
    *@param params Dictionary
    *@param callback
    */
    public func updateVideoDetails(videoId:String,params:Dictionary<String,AnyObject>,callback:(String,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.UPDATEVIDEODETAILS,videoId) as String
        JsapiRest.putRequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    println(result)
                    callback("","",issuccess)
                }
                
        }
    }
    
    /** add User Uploaded MediaItem Assests
    *@param params Dictionary
    *@param callback
    */
    public func addUserUploadedMediaItemAssests(params:Dictionary<String,AnyObject>,callback:(String,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDUSERUPLOADEDMEDIAITEMASSESTS
        JsapiRest.postrequest(methodUrl, postParams : Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    println(result)
                    callback("","",issuccess)
                }
                
        }
    }

}