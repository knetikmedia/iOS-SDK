//
//  NotificationService.swift
//  JsapiApi
//
//  Created by youssef on 22/1/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**
*/

import Foundation

open class NotificationService : NSObject
{
    
    /** Get Notifications
    *@param params Dictionary
    *@param callback
    */
    open func getNotifications(_ params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.NOTIFICATIONS
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseResponse(fromDictionary: result)

                if(!issuccess)
                {

                    callback(result ,baseResponse.errormessage,issuccess)
                    
                }else
                {

                    callback(result,"",issuccess)
                    
                }
                
        }
    }

    open func getChallengeCode(_ params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.NOTIFICATIONSCHALLENGECODE
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    
                    callback(result ,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    callback(result,"",issuccess)
                    
                }
                
        }
    }

    
    
    /** Add  Notification
    *@param params Dictionary
    *@param callback
    */
    open func addNotification(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.NOTIFICATIONS
        
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
    
    
    /** Add  Notification
     *@param params Dictionary
     *@param callback
     */
    open func markNotificationAsRead(_ notificationID:String, params:Dictionary<String,AnyObject> , callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let url  = JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.SEENNOTIFICATIONS
        
        let methodUrl:String=NSString(format: url as NSString ,notificationID) as String
        
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

    /** Add  Notification
     *@param params Dictionary
     *@param callback
     */
    open func markAllNotificationAsRead(_ params:Dictionary<String,AnyObject> , callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.SEENALLNOTIFICATIONS
        
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

    
    
    /** Add  Notification
     *@param params Dictionary
     *@param callback
     */
    open func addCustomCall(_ endpointurl:String ,params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        
        JsapiRest.sharedInstance.postrequest(endpointurl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    callback(result,baseResponse.errormessage,issuccess)
                }else
                {
                    callback(result,"",issuccess)
                }
                
        }
    }

    
  
}
