//
//  Comment.swift
//  JsapiApi
//
//  Created by youssef on 3/24/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class CommentService
{
    public init (){}
    /**Adds a new comment to an item. Requires user authentication.
    *@param params Dictionary{"comment": "","item_id": 0}
    *@param callback
    */
    public func addComment(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDCOMMENT;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    println(result)
                    callback(baseResponse,"",issuccess)

                }
                
        }
    }

    /**Returns a list of all comments currently attached to a given item. Maximum of 2000 returned
    *@param params Dictionary{"item_id": 0}
    *@param callback
    */
    public func commentsList(params:Dictionary<String,String>,callback:(Array<Comment>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.COMMENTLIST;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var commentResponse=CommentResponse(fromDictionary: result);
                if(!issuccess)
                {
                    callback(commentResponse.comments,commentResponse.errormessage,issuccess)

                }else
                {
                    callback(commentResponse.comments,"",issuccess)
                }
        }
    }

    
    /**Deletes a comment from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    public func deleteComment(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETECOMMENT;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }

    /**Removes a comment from an item. Must have authorization as the user that originally posted the comment. (alias for delete)
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    public func removeComment(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REMOVECOMMENT;
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
