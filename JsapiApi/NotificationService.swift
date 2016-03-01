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

public class NotificationService : NSObject
{
    
    /** Get Notifications
    *@param params Dictionary
    *@param callback
    */
    public func getNotifications(params:Dictionary<String,AnyObject>,callback:(NSDictionary,String,Bool)->Void)
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

    public func getChallengeCode(params:Dictionary<String,AnyObject>,callback:(NSDictionary,String,Bool)->Void)
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
    public func addNotification(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
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
    public func markNotificationAsRead(notificationID:String, params:Dictionary<String,AnyObject> , callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.SEENNOTIFICATIONS,notificationID) as String
        
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
    public func addCustomCall(endpointurl:String ,params:Dictionary<String,AnyObject>,callback:(NSDictionary,String,Bool)->Void)
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