//
//  User.swift
//  JsapiApi
//
//  Created by youssef on 3/20/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class UserService:NSObject {
 

 /**get User Info /services/latest/user/getinfo
 *@param params Dictionary Empty Dictionary {}
 *@param callback
 */
 public func getUserInfo(params:Dictionary<String,String>,callback:(User,String,Bool)->Void)
 {
        
   let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERINFO;
    JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
    {
            (result:NSDictionary,issuccess:Bool) in
            var userResponse = UserResponse(fromDictionary: result)
            if(!issuccess)
            {
                print(result["error"])
                print(result["error_description"])
                print(userResponse.errormessage)
                
                callback(User(),userResponse.errormessage,issuccess)

            }else
            {
                print(result)
                callback(userResponse.user,"",issuccess)

            }
    }
 }
    
    
  /**update User Info /services/latest/user/update
  *@param params Dictionary{"userId": 0,"configName": "","configValue": ""}
  *@param callback
 */
    public func updateUserInfo(configName:String,params:String,callback:(AnyObject,String,Bool)->Void)
    {
        var methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.UPDATEUSERINFO,configName) as String
        JsapiRest.putRequest(methodUrl, postParams: Utilities.getformatedPutString(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    print(result)
                    callback(baseResponse,"",issuccess)

                }
        }
    }
   
    /**set Password /services/latest/user/%@/password
    *@param params Dictionary {password: newPasswordString}
    *@param callback
    */
    public func setPassword(params:Dictionary<String,String>,userID:String,callback:(AnyObject,String,Bool)->Void)
    {
        var endpoint=NSString(format: JSAPIConstant.SETUSERPASSWORD,userID)

        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String);
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    print(result)
                    callback(baseResponse,"",issuccess)

                }
        }
    }
    

}