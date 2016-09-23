//
//  Comment.swift
//  JsapiApi
//
//  Created by youssef on 3/24/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class FlagService:NSObject
{
    /**Adds a new Flag to an item. Requires user authentication.
    *@param
    *@param callback
    */
    open func addFlag(_ videoID:String,params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.FLAGS;
        let methodUrl=NSString(format:url as NSString,videoID)
        JsapiRest.sharedInstance.postrequest(methodUrl as String, postParams: Utilities.getPostValueRequestFromDictionary(params as Dictionary<String, AnyObject>), isJson: true)
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

    /**Returns a list of all flags currently attached to a given item. Maximum of 2000 returned
    *@param params Dictionary{"item_id": 0}
    *@param callback
    */
    open func flagsList(_ params:Dictionary<String,String>,callback:@escaping (Array<Flag>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFLAGS
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
            {
                (result:NSDictionary,issuccess:Bool) in
                let flagresponse=FlagBaseResponse(fromDictionary:result);
                if(!issuccess)
                {
                    callback(flagresponse.content.content,flagresponse.errormessage,issuccess)

                }else
                {
                    callback(flagresponse.content.content,"",issuccess)
                }
        }
    }

    
    /**Deletes a flag from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    open func deleteFlag(_ params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEFLAG;
        
        let methodUrl=NSString(format:url as NSString ,params["id"]!)
        JsapiRest.sharedInstance.deleteRequest(methodUrl as String, deleteParams: Utilities.jsonRequestFromDictionary(params))
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
    
}
