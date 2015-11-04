//
//  Comment.swift
//  JsapiApi
//
//  Created by youssef on 3/24/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class FlagService:NSObject
{
    /**Adds a new Flag to an item. Requires user authentication.
    *@param
    *@param callback
    */
    public func addFlag(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.FLAGS;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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
    public func flagsList(params:Dictionary<String,String>,callback:(Array<Flag>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.FLAGS
        
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
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
    public func deleteFlag(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEFLAG,params["id"]!)
        JsapiRest.deleteRequest(methodUrl as String, deleteParams: Utilities.jsonRequestFromDictionary(params))
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
