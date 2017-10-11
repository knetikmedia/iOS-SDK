//
//  User.swift
//  JsapiApi
//
//  Created by youssef on 3/20/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class UserService:NSObject {
 

 /**get User Info /services/latest/user/getinfo
 Dictionary Empty Dictionary {}
 */
 open func getUserInfo(_ params:Dictionary<String,String>,callback:@escaping (User,String,Bool)->Void)
 {
        
   let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERINFO
    JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
    {
            (result:NSDictionary,issuccess:Bool) in
            let userResponse = UserResponse(fromDictionary: result)
            if(!issuccess)
            {
                
                callback(User(),userResponse.errormessage,issuccess)

            }else
            {
                callback(userResponse.user,"",issuccess)

            }
    }
 }
    
    /**get User Info /services/latest/user/getinfo
     Dictionary Empty Dictionary {}
     */
    open func getUserInfoByUserId(_ userId:String,params:Dictionary<String,String>,callback:@escaping (User,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERINFOBYID
        
        let methodUrl:String = NSString(format: url as NSString,userId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
        {
            (result:NSDictionary,issuccess:Bool) in
            let userResponse = UserResponse(fromDictionary: result)
            if(!issuccess)
            {
                
                callback(User(),userResponse.errormessage,issuccess)
                
            }else
            {
                callback(userResponse.user,"",issuccess)
                
            }
        }
    }

    
    
    /**get User Info /services/latest/user/getinfo
    Dictionary Empty Dictionary {}
    */
open func getUserAchievements(_ params:Dictionary<String,String>,callback:@escaping (Array<Achievement>,String,Bool)->Void)
    {
        
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETACHIEVEMENT
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let achievementResponse = UserAchievementsResponse(fromDictionary: result)
                if(!issuccess)
                {
                    
                    callback(achievementResponse.achievements.achievement,achievementResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(achievementResponse.achievements.achievement,"",issuccess)
                    
                }
        }
    }

    
    
  /**update User Info /services/latest/user/update
  Dictionary{"userId": 0,"configName": "","configValue": ""}
     */
    open func updateUserInfo(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.UPDATEUSERINFO
        
        let methodUrl=NSString(format: url as NSString) as String
        
        JsapiRest.sharedInstance.putRequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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
   
    /**set Password /services/latest/user/%@/password
    Dictionary {password: newPasswordString}
    */
    open func setPassword(_ params:Dictionary<String,String>,userID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SETUSERPASSWORD as NSString,userID)

        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String);
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
    
    
    /**set user Group /users/groups/{unique_name}/members
    Dictionary {password: newPasswordString}
     */
    open func addUserToGroup(_ params:Dictionary<String,String>,groupName:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SETUSERGROUP as NSString,groupName)
        
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String);
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
    
    /**get User Info /services/latest/user/getinfo
     Dictionary Empty Dictionary {}
     */
    open func getSignedUrl(_ params:Dictionary<String,String>,callback:@escaping (S3FileResponse,String,Bool)->Void)
    {
        
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.AWSSIGNEDURL
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
        {
            (result:NSDictionary,issuccess:Bool) in
            let response = S3FileResponse(fromDictionary: result)
            if(!issuccess)
            {
                
                callback(response,"",issuccess)
                
            }else
            {
                callback(response,response.errormessage,issuccess)
                
            }
        }
    }



}
