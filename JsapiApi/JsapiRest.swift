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
        print(functionURL)
        print(postParams)
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
                print("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
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
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(responseString)

            if(responseString == "")
            {
                print("Empty Response")
                 callback(NSDictionary(),true)
                return;
            }
            let jsonResult: NSDictionary! = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers ) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            if(jsonResult["error"] != nil && isJson)
            {
                if jsonResult["error"] is Dictionary<String,Bool>{
                let errorObject = jsonResult["error"] as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
                }else
                {
                    let errorObject = jsonResult["error"] as! String
                    let error_description = jsonResult["error_description"] as! String

                    let isSuccess = false
                    var dictionary = Dictionary<String ,String>()
                     dictionary.updateValue(errorObject,forKey: "error")
                    dictionary.updateValue(error_description,forKey: "error_description")

                    callback(jsonResult , isSuccess)

                }
                
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
        print(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL+postParams)!)
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            print("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
        }
        print(JsapiAPi.sharedInstance.getJsapiToken())
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                callback(NSDictionary(),true)
                return
            }
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            let jsonResult: NSDictionary! = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            
            if(jsonResult["error"] != nil )
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
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
        print(deleteParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            print("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
        }
        print(JsapiAPi.sharedInstance.getJsapiToken())
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            let httpResponse = response as! NSHTTPURLResponse
            
            if error != nil {
                callback(NSDictionary(),false)
                return
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }
            
            print("responseString = \(responseString)")
            let jsonResult: NSDictionary! = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers ) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            
            if(jsonResult["error"] != nil )
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
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
        print(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "PUT"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            print("token not empty :"+JsapiAPi.sharedInstance.getJsapiToken())
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
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            if(responseString=="")
            {
                callback(NSDictionary(),true)

                return;
            }
            let jsonResult: NSDictionary! = try! NSJSONSerialization.JSONObjectWithData(data! , options: NSJSONReadingOptions.MutableContainers ) as? NSDictionary
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            
            if(jsonResult["error"] != nil && isJson)
            {
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
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