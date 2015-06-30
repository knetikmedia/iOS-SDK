//
//  JsapiRest.swift
//  JsapiApi
//
//  Created by youssef on 3/12/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JsapiRest
{
    //
    /**
    postRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/oauth/token
    @param postParams : post string
    @param isJson should sent true in case of json request
    @param callback block called once you got the response
    */
    class func postrequest(functionURL:String,postParams:String,isJson:Bool,callback:(NSDictionary,Bool)->Void)
    {
        println(functionURL)
        println(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "POST"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR)
            {
                println("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
                request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            }
            
        }else{
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                callback(NSDictionary(),false)
                return
            }
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(responseString)
            
            if(responseString=="")
            {
                println("Empty Response")
                callback(NSDictionary(),true)
                return;
            }
            var eerror : AutoreleasingUnsafeMutablePointer<NSError?> = nil
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: eerror) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),false)
                return;
            }
            if(jsonResult["error"] != nil && isJson)
            {
                let errorObject = jsonResult["error"] as! Dictionary<String,Bool>
                
                var isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
            }else
                if(jsonResult["error"] != nil)
                {
                    callback(jsonResult,false)
                    
                }else
                {
                    callback(jsonResult,true)
            }
        }
        task.resume()
    }
    
    
    
    //
    /**
    getRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/services/latest/carts/e9486b32-674
    @param callback block called once you got the response
    */
    class func getRequest(functionURL:String,postParams:String,callback:(NSDictionary,Bool)->Void)
    {
        println(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL+postParams)!)
        request.HTTPMethod = "GET"
        let postString = postParams
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            println("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
        }
        println(JsapiAPi.sharedInstance.getJsapiToken())
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                callback(NSDictionary(),true)
                return
            }
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
            var eerror : AutoreleasingUnsafeMutablePointer<NSError?> = nil
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: eerror) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),false)
                return;
            }
            
            if(jsonResult["error"] != nil )
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                var isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
            }else
            {
                callback(jsonResult,true)
            }
        }
        task.resume()
    }
    
    
    //
    /**
    DELETERequet
    @param functionURL : function URL Example
    @param callback block called once you got the response
    */
    class func deleteRequest(functionURL:String,deleteParams:String,callback:(NSDictionary,Bool)->Void)
    {
        println(deleteParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            println("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
        }
        println(JsapiAPi.sharedInstance.getJsapiToken())
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                callback(NSDictionary(),true)
                return
            }
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
            var eerror : AutoreleasingUnsafeMutablePointer<NSError?> = nil
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: eerror) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            
            if(jsonResult["error"] != nil )
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                var isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
            }else
            {
                callback(jsonResult,true)
            }
        }
        task.resume()
    }
    
    //
    /**
    putRequest
    @param functionURL : function URL Example http://localhost:8080/jsapi/oauth/token
    @param postParams : post string
    @param isJson should sent true in case of json request
    @param callback block called once you got the response
    */
    class func putRequest(functionURL:String,postParams:String,isJson:Bool,callback:(NSDictionary,Bool)->Void)
    {
        println(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "PUT"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
                println("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
                request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            }
        }else{
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                callback(NSDictionary(),false)
                return
            }
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
            if(responseString=="")
            {
                callback(NSDictionary(),true)
                
                return;
            }
            var eerror : AutoreleasingUnsafeMutablePointer<NSError?> = nil
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: eerror) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),false)
                return;
            }
            
            if(jsonResult["error"] != nil && isJson)
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                var isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
            }else
                if(jsonResult["error"] != nil)
                {
                    callback(jsonResult,false)
                    
                }else
                {
                    callback(jsonResult,true)
            }
        }
        task.resume()
    }
    
    
    
}