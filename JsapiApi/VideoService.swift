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
public class VideoService:NSObject
{
    
    /** Get Artist and Global Videos
    *@param params Dictionary
    *@param callback
    */
    public func getVideos(params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETVIDEOS
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
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
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERVIDEOS,userId) as String
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
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
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(baseResponse.videos,"",issuccess)
                    
                }
                
        }
    }

    /** Get Friends Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    public func getFriendsVideos(userId:String,params:Dictionary<String,AnyObject>,callback:(Array<Video>,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDSVIDEO,userId) as String
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                if(!issuccess)
                {
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse.videos,"",issuccess)
                }
                
        }
    }
    
    
    /** Add User Video
    *@param params Dictionary
    *@param callback
    */
    public func addVideo(params:Dictionary<String,AnyObject>,callback:(Video,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDVIDEO
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Video(),baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse.video,"",issuccess)
                }
                
        }
    }
    
    
    /** Add User Video
     *@param params Dictionary
     *@param callback
     */
    public func addContributor(videoId:String , params:Dictionary<String,AnyObject> , callback:(String,Bool)->Void)
    {
           let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDCONTRIBUTOR,videoId) as String

        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.errormessage,issuccess)
                }else
                {
                    callback("",issuccess)
                }
                
        }
    }

    
    /** update VideoViews Count
    *@param params Dictionary
    *@param callback
    */
    public func updateVideoViewsCount(videoId:String,params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format:JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.VIEWVIDEO,videoId) as String
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse,"",issuccess)
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
        JsapiRest.sharedInstance.putRequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    callback("","",issuccess)
                }
                
        }
    }
 
    
    /**Deletes a Video from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    public func deleteVideo(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEVIDEO,params["id"]!)
        JsapiRest.sharedInstance.deleteRequest(methodUrl as String, deleteParams: "")
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(baseResponse,"",issuccess)
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
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams : Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    callback("","",issuccess)
                }
                
        }
    }

}