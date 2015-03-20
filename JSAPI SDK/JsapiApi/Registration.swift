//
//  Registration.swift
//  JsapiApi
//
//  Created by youssef on 3/19/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Registration :NSObject
{
    /*Generates/verifies a temporary secret to allow users to login without their password
    * /services/latest/registration/forgotPassword
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    public func forgotPassword(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.FORGOTPASSWORD
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    
    /*Creates a guest user and returns a random password.
    * /services/latest/registration/guests
    @param Empty Params
    @param callback Interface
    */
    public func guests(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.GUESTS
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    /*Upgrade a guest user to a regular account
    * /services/latest/registration/guestUpgrade
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    public func guestUpgrade(params:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=JSAPIConstant.GUESTUPGRADE
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    /**Creates a user using the information provided
    * /services/latest/registration
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    */
    public func doUserRegistration(registerationDetails:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REGISTER
        println(methodurl)
        JsapiPost.postrequest(methodurl,postParams:  Utilities.jsonRequestFromDictionary(registerationDetails),isJson:true)
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