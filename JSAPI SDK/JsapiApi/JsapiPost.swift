//
//  JsapiPost.swift
//  JsapiApi
//
//  Created by youssef on 3/4/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JsapiPost
{//
    /**
    postRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/oauth/token
    @param postParams : post string
    @param isJson should sent true in case of json request
    @param callback block called once you got the response
    */
    class func postRequet(functionURL:String,postParams:String,isJson:Bool,callback:(NSDictionary,Bool)->Void)
    {
        println(postParams)
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "POST"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
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
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
            if(jsonResult["error"] != nil && isJson)
            {
                let errorObject = jsonResult["error"]  as Dictionary<String,Bool>

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

