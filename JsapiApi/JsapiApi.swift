//
//  JsapiApi.swift
//  JsapiApi
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class JsapiAPi:NSObject
{
    
    private static var __once: () = {
            Statics.instance=JsapiAPi()
         
        }()
    
    fileprivate var jsapiurl:String=""
    fileprivate var notificationUrl:String=""

    fileprivate var client_id:String=""
    fileprivate var username:String=""
    fileprivate var password:String=""
    fileprivate var secrect_key:String=""
    fileprivate var token=""
    fileprivate var token_type=""
    fileprivate var refresh_token=""
    

    
    /**
    return a Singleton for JsapiApi class
    
    */
    
    struct Statics
    {
        static var instance:JsapiAPi?
        static var token:Int=0
        
    }
    
   open class var sharedInstance:JsapiAPi
    {
    
        _ = JsapiAPi.__once
        return Statics.instance!
    }
    
    /**
    Jsapi Init function should be called in App Delegate in function (didFinishLaunchingWithOptions).
    jsapiurl jsapi url it should be like http://www.knetik.com
    client_id first username in Client Table
    secrect_key optional paramter
    */
    
    open class func jsapiInit(_ jsapiurl:String,client_id:String,secrect_key:String,notificationUrl:String)
    {
        if(jsapiurl.isEmpty){
            return;
        }
        if(client_id.isEmpty){
              return;
        }

        JsapiAPi.sharedInstance.jsapiurl=jsapiurl
        JsapiAPi.sharedInstance.client_id=client_id
        JsapiAPi.sharedInstance.secrect_key=secrect_key
        JsapiAPi.sharedInstance.notificationUrl = notificationUrl
    }
    /**
    reset function
    */
    open func reset()
    {
        JsapiAPi.sharedInstance.jsapiurl=""
        JsapiAPi.sharedInstance.client_id=""
        JsapiAPi.sharedInstance.username=""
        JsapiAPi.sharedInstance.password=""
        JsapiAPi.sharedInstance.secrect_key=""
        JsapiAPi.sharedInstance.token=""
        JsapiAPi.sharedInstance.notificationUrl = ""
    }
   
    
    /**
    do User Registration
    */
    open func doUserRegistration(_ registerationDetails:Dictionary<String,String>,callback:@escaping (NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.REGISTER

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: jsonRequestFromDictionary(registerationDetails),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                callback(result,issuccess)
        }
    }

    
    /**
    do User Login
    */
    open func doUserLogin(_ loginDetails:Dictionary<String,String>,callback:@escaping (NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.OAUTH_TOKEN

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: authenticateRequestFromDictionary(loginDetails),isJson:false)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(issuccess)
                {
                    if(result.count == 0 ){
                        
                        callback(result,false)
                        return
                    }
                    
                    self.token=result.value(forKey: "access_token") as! String!
                    self.token_type=result.value(forKey: "token_type") as! String!
                    if(result.value(forKey: "refresh_token") != nil){

                    self.refresh_token = result.value(forKey: "refresh_token") as! String!
                    }
                }
                callback(result,issuccess)
        }
    }
    
    /**
     do User Login
     */
    open func doRefreshToken(_ callback:@escaping (NSDictionary,Bool)->Void)
    {
        var refreshRequest = Dictionary<String,String>();
        
        refreshRequest["refresh_token"] = self.refresh_token
        
        let methodurl:String=jsapiurl+JSAPIConstant.OAUTH_TOKEN
        
        JsapiRest.sharedInstance.postrequest(methodurl,postParams: authenticateRefreshTokenRequestFromDictionary(refreshRequest),isJson:false)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(issuccess)
                {
                    self.token=result.value(forKey: "access_token") as! String!
                    self.token_type=result.value(forKey: "token_type") as! String!
                    if(result.value(forKey: "refresh_token") != nil){
                        
                        self.refresh_token = result.value(forKey: "refresh_token") as! String!
                    }
                }
                callback(result,issuccess)
        }
    }

    
    /**
    do User Login
    */
    open func doFacebookLogin(_ loginDetails:Dictionary<String,String>,callback:@escaping (NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.OAUTH_TOKEN

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: authenticateFacebookRequestFromDictionary(loginDetails),isJson:false)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(issuccess)
                {
                    if(result.count == 0 ){
                    
                        callback(result,false)
                        return
                    }
                    
                    self.token=result.value(forKey: "access_token") as! String!
                    self.token_type=result.value(forKey: "token_type") as! String!
                    
                    if(result.value(forKey: "refresh_token") != nil){
                    self.refresh_token = result.value(forKey: "refresh_token") as! String!
                    }

                }
                callback(result,issuccess)
        }
    }


    /**
    do User Logout
    */
    open func doUserLogout()
    {
    self.token_type="";
    self.token="";
    }

    /*
    generate auth request token from Dictionary
    */
    func authenticateRequestFromDictionary(_ requestparamters:Dictionary<String,String>)->String
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        commonParamtersDictionry["client_id"]=JsapiAPi.sharedInstance.client_id
        commonParamtersDictionry["grant_type"]="password"
        if(!JsapiAPi.sharedInstance.secrect_key.isEmpty){
        commonParamtersDictionry["client_secret"]=JsapiAPi.sharedInstance.secrect_key
        }
       for key in requestparamters.keys
       {
        commonParamtersDictionry[key]=requestparamters[key]
       }
        var postString:String=""
        for key in commonParamtersDictionry.keys
        {
           postString+=key+"="+commonParamtersDictionry[key]!
            postString+="&"
        }
        return postString
    }
    
    /*
    generate auth request token from Dictionary
    */
    func authenticateRefreshTokenRequestFromDictionary(_ requestparamters:Dictionary<String,String>)->String
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        commonParamtersDictionry["client_id"]=JsapiAPi.sharedInstance.client_id
        commonParamtersDictionry["grant_type"]="refresh_token"
        if(!JsapiAPi.sharedInstance.secrect_key.isEmpty){
            commonParamtersDictionry["client_secret"]=JsapiAPi.sharedInstance.secrect_key
        }
        for key in requestparamters.keys
        {
            commonParamtersDictionry[key]=requestparamters[key]
        }
        var postString:String=""
        for key in commonParamtersDictionry.keys
        {
            postString+=key+"="+commonParamtersDictionry[key]!
            postString+="&"
        }
        return postString
    }

    
    /*
    generate facebook auth request token from Dictionary
    */
    func authenticateFacebookRequestFromDictionary(_ requestparamters:Dictionary<String,String>)->String
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        commonParamtersDictionry["client_id"]=JsapiAPi.sharedInstance.client_id
        commonParamtersDictionry["grant_type"]="facebook"
        if(!JsapiAPi.sharedInstance.secrect_key.isEmpty){
            
            commonParamtersDictionry["client_secret"]=JsapiAPi.sharedInstance.secrect_key
            
        }
        for key in requestparamters.keys
        {
            commonParamtersDictionry[key]=requestparamters[key]
        }
        var postString:String=""
        for key in commonParamtersDictionry.keys
        {
            postString+=key+"="+commonParamtersDictionry[key]!
            postString+="&"
      }
        return postString
    }
    
    
    func sessionExpired() {
    
        let appDelegate = UIApplication.shared.delegate
        
            appDelegate?.perform(#selector(JsapiAPi.sessionExpired))
    
    }
    
    /*
    generate Json Request from Dictionary
    */
    func jsonRequestFromDictionary(_ requestparamters:Dictionary<String,String>)->String
    {
        let body = try! JSONSerialization.data(withJSONObject: requestparamters, options: [] )
        let datastring: String = NSString(data:body, encoding:String.Encoding.utf8.rawValue)! as String
        return datastring
    }


    open func getJsapiUrl()->String
    {
    return jsapiurl;
    }

    open func getJsapiToken()->String
    {
        return self.token_type+" "+self.token;
    }
    
    open func getJsapiOriginalToken()->String
    {
        return self.token;
    }

    open func getNotificationUrl()->String
    {
        return self.notificationUrl;
    }

}
