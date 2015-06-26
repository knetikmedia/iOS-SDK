//
//  Registration.swift
//  JsapiApi
//
//  Created by youssef on 3/19/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Registration
{
    public init (){}

    /*Generates/verifies a temporary secret to allow users to login without their password
    * /services/latest/registration/forgotPassword
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    public func forgotPassword(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.FORGOTPASSWORD
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    
    /*Creates a guest user and returns a random password.
    * /services/latest/registration/guests
    @param Empty Params
    @param callback Interface
    */
    public func guests(params:Dictionary<String,String>,callback:(GuestUser,String,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.GUESTS
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var guestResponse=GuestUserResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(GuestUser(),guestResponse.errormessage,issuccess)

                }else
                {
                    callback(guestResponse.guestUser,"",issuccess)
                }
        }
        
        
    }
    /*Upgrade a guest user to a regular account
    * /services/latest/registration/guestUpgrade
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    public func guestUpgrade(params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.GUESTUPGRADE
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    /**Creates a user using the information provided
    * /services/latest/registration
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    */
    public func doUserRegistration(registerationDetails:Dictionary<String,String>,callback:(RegisteredUser,String,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REGISTER
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams:  Utilities.jsonRequestFromDictionary(registerationDetails),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var registeredResponse=RegisteredUserResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(RegisteredUser(),registeredResponse.errormessage,issuccess)
                }else
                {
                    callback(registeredResponse.registeredUser,"",issuccess)
                }
        }
    }
    

    
}