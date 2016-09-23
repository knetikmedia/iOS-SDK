//
//  Comment.swift
//  JsapiApi
//
//  Created by youssef on 3/24/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class CommentService:NSObject
{
    /**Adds a new comment to an item. Requires user authentication.
    *@param params Dictionary{"comment": "","item_id": 0}
    *@param callback
    */
    open func addComment(_ videoId:String,params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDCOMMENT
        
        let methodUrl=NSString(format: url as NSString ,videoId)

        JsapiRest.sharedInstance.postrequest(methodUrl as String, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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

    /**Returns a list of all comments currently attached to a given item. Maximum of 2000 returned
    *@param params Dictionary{"item_id": 0}
    *@param callback
    */
    open func commentsList(_ videoId:String,params:Dictionary<String,String>,callback:@escaping (Array<Comment>,String,Bool)->Void)
    {
        
        let url  = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.COMMENTLIST
        
        let methodUrl=NSString(format: url as NSString ,videoId)

        JsapiRest.sharedInstance.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let commentResponse=CommentResponse(fromDictionary:result);
                    callback(commentResponse.comments,commentResponse.errormessage,issuccess)

                }else
                {
                    let commentResponse=CommentResponse(fromDictionary: (result["result"] as? NSDictionary)!);

                    callback(commentResponse.comments,"",issuccess)
                }
        }
    }

    
    /**Deletes a comment from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    open func deleteComment(_ videoId:String , params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
         
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETECOMMENT
        
        let methodUrl=NSString(format: url as NSString ,videoId)
        
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
