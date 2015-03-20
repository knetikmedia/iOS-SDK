//
//  User.swift
//  JsapiApi
//
//  Created by youssef on 3/20/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class User: NSObject {
 
 /**get User Info /services/latest/user/getinfo
 *@param params Dictionary Empty Dictionary {}
 *@param callback
 */
 public func getUserInfo(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
 {
        
   let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERINFO;
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
    
    
  /**update User Info /services/latest/user/update
  *@param params Dictionary{"userId": 0,"configName": "","configValue": ""}
  *@param callback
 */
  public func updateUserInfo(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.UPDATEUSERINFO;
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
   
    /**set Password /services/latest/user/%@/password
    *@param params Dictionary {password: newPasswordString}
    *@param callback
    */
    public func setPassword(params:Dictionary<String,String>,userID:String,callback:(NSDictionary,Bool)->Void)
    {
        var endpoint=NSString(format: JSAPIConstant.SETUSERPASSWORD,userID)

        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint;
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