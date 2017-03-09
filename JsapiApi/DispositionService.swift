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
open class DispositionService:NSObject
{
    

    /** Get Dispositions
    *@param params Dictionary
    *@param callback
    */
    open func getDispositions(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Disposition>,String,Bool)->Void)
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
    
    /** Get Dispositions
     *@param params Dictionary
     *@param callback
     */
    open func getMineDispositions(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Disposition>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETMINEDISPOSITION
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=DispositionResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback([Disposition](),baseResponse.errormessage,issuccess)
                    
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
    open func getDispositionsCount(_ params:Dictionary<String,AnyObject>,callback:@escaping (Dictionary<String,AnyObject>,String,Bool)->Void)
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
    open func addDisposition(_ params:Dictionary<String,AnyObject>,request:Dictionary<String,AnyObject>,callback:@escaping (Disposition,String,Bool)->Void)
    {
        
        let methodUrl = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDDISPOSITION
        
      //  let methodUrl = NSString(format: url as NSString, params["context"] as! String , params["context_id"] as! String )
        
        var dis = Disposition();
        dis.context = params["context"] as! String!;
        dis.contextId = params["context_id"] as! String!;
        dis.name = request["name"] as! String!;
        
        JsapiRest.sharedInstance.postrequest(methodUrl as String, postParams: Utilities.jsonRequestFromDictionary(dis.toDictionary() as! Dictionary<String, AnyObject>), isJson: true)
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
    open func deleteDisposition(_ params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEDISPOSITION
        let methodUrl=NSString(format: url as NSString ,params["id"]!)
        
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
