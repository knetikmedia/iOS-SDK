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
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=DispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.result.content,baseResponse.errormessage,issuccess)
                    
                }else
                {

                    callback(baseResponse.result.content,"",issuccess)
                    
                }
                
        }
    }
    
    
    /** Get Dispositions Count
     *@param params Dictionary
     *@param callback
     */
    public func getDispositionsCount(params:Dictionary<String,AnyObject>,callback:(Dictionary<String,AnyObject>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETDISPOSITIONCOUNT
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=DispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(result as! Dictionary<String, AnyObject>,baseResponse.errormessage,issuccess)
                    
                }else
                {

                    callback(result as! Dictionary<String, AnyObject>,"",issuccess)
                    
                }
                
        }
    }

    
    /**Add a new Dispostion . Requires user authentication.
    *@param params Dictionary
    *@param callback
    */
    public func addDisposition(params:Dictionary<String,AnyObject>,request:Dictionary<String,AnyObject>,callback:(Disposition,String,Bool)->Void)
    {
        let methodUrl = NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDDISPOSITION, params["context"] as! String , params["contextId"] as! String )
        JsapiRest.sharedInstance.postrequest(methodUrl as String, postParams: Utilities.getPostValueRequestFromDictionary(request), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=NewDispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Disposition(),baseResponse.errormessage,issuccess)
                    
                }else
                {

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
        
        JsapiRest.sharedInstance.deleteRequest(methodUrl as String, deleteParams:Utilities.jsonRequestFromDictionary(params))
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