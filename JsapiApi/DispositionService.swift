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
public class DispositionService:NSObject
{
    

    /** Get Dispositions
    *@param params Dictionary
    *@param callback
    */
    public func getDispositions(params:Dictionary<String,AnyObject>,callback:(Array<Disposition>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DISPOSITION
        JsapiRest.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=DispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.result.content,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.result.content,"",issuccess)
                    
                }
                
        }
    }
    
    
    /**Add a new Dispostion . Requires user authentication.
    *@param params Dictionary
    *@param callback
    */
    public func addDisposition(params:Dictionary<String,AnyObject>,callback:(Disposition,String,Bool)->Void)
    {
        let methodUrl = NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDDISPOSITION, params["context"] as! String , params["contextId"] as! String )
        JsapiRest.postrequest(methodUrl as String, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=NewDispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }
    

    /**Deletes a Dispostion from an item. Must have authorization as the user that originally posted the Dispostion.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    public func deleteDisposition(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEDISPOSITION,params["id"]!)
        
        JsapiRest.deleteRequest(methodUrl as String, deleteParams:Utilities.jsonRequestFromDictionary(params))
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