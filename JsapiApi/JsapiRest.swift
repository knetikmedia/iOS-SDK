//
//  JsapiRest.swift
//  JsapiApi
//
//  Created by youssef on 3/12/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JsapiRest :NSObject,NSURLSessionDelegate
{
    
    private var requests:Dictionary<String,NSMutableURLRequest> = Dictionary<String,NSMutableURLRequest>()

    class var sharedInstance:JsapiRest
    {
        struct Statics
        {
            static var instance:JsapiRest?
            static var token:dispatch_once_t=0
            
        }
        dispatch_once(&Statics.token)
            {
                Statics.instance=JsapiRest()
                
        }
        return Statics.instance!
    }

    
    //
    /**
    postRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/oauth/token
    @param postParams : post string
    @param isJson should sent true in case of json request
    @param callback block called once you got the response
    */
    func postrequest(functionURL:String,postParams:String,isJson:Bool,callback:(NSDictionary,Bool)->Void)
    {
 
        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        
        request.HTTPMethod = "POST"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty &&
            JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR
            && !functionURL.containsString("google")
            )
            {
                request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            }

        }else{
            
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        self.requests[functionURL] = request
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        
     
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                
                callback(res,false)
                return
            }
            //self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
           
            let httpResponse = response as! NSHTTPURLResponse
            
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }
            
            //Redirection
           
            

            if(responseString == "")
            {

                callback(NSDictionary(),true)
                
                return;
            }
            let jsonResult2: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers )
            
            if(jsonResult2 == nil ){

                callback(NSDictionary(),false)
                
            return
            }
            let jsonResult : NSDictionary = (jsonResult2 as?NSDictionary)!;
            
            
            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307){
                
                self.postrequest(httpResponse.URL!.absoluteString , postParams: postParams, isJson: isJson, callback: callback)
            }
            
//            if(jsonResult == nil)
//            {
//                callback(NSDictionary(),true)
//                return;
//            }
            

            if(jsonResult["error"] != nil && isJson)
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                }
                
                if jsonResult["error"] is Dictionary<String,Bool>{
                let errorObject = jsonResult["error"] as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
                callback(jsonResult,isSuccess!)
                    
                }else
                {
                    
                    let isSuccess = false

                    if let _ = jsonResult["error"] as? String {
                        
                    let errorObject = jsonResult["error"] as! String
                    
                    let error_description = jsonResult["error_description"] as! String

                    var dictionary = Dictionary<String ,String>()
                    dictionary.updateValue(errorObject,forKey: "error")
                    dictionary.updateValue(error_description,forKey: "error_description")
                    }
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
    func getRequest(functionURL:String,postParams:String,callback:(NSDictionary,Bool)->Void)
    {

        var endpoint:String = functionURL + postParams

        endpoint = endpoint.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let request = NSMutableURLRequest(URL: NSURL(string: endpoint )!)
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            
        }
        
     //   print(functionURL)

         self.requests[functionURL] = request
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
           
          //  print(request.URL!.absoluteString)
          //  print(request.URL!.absoluteURL)

           // self.requests.removeValueForKey(request.URL!.absoluteString)

            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)

            let httpResponse = response as! NSHTTPURLResponse

            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307 ){
                self.getRequest(httpResponse.URL!.absoluteString , postParams: postParams,callback: callback)
                return;
            }

            if(data == nil || data?.length <= 0 ){
            
                callback(NSDictionary(),false)
                return;

            }
            
            let jsonResult2: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)

            if(jsonResult2 == nil)
            {
                callback(NSDictionary(),false)
                return;
            }

            
            let jsonResult:NSDictionary = (jsonResult2 as? NSDictionary)!
            
            
            
            if(jsonResult["error"] != nil )
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                 JsapiAPi.sharedInstance.sessionExpired()
                    
                   callback(jsonResult,false)
                    
                }else{
                    
                let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]?.boolValue
                    callback(jsonResult,isSuccess!)
                }
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
    func deleteRequest(functionURL:String,deleteParams:String,callback:(NSDictionary,Bool)->Void)
    {

        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){

            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            
        }
        
        self.requests[functionURL] = request
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)

        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            
            let httpResponse = response as! NSHTTPURLResponse
            
            if error != nil {
                
                var res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
            
           // self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }
        
            let jsonResult: NSDictionary! = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers ) as? NSDictionary
            
            if(httpResponse.URL!.absoluteString != functionURL && httpResponse.statusCode > 301 ){
                self.deleteRequest(httpResponse.URL!.absoluteString , deleteParams: deleteParams, callback: callback)
                return
            }

            
            if(jsonResult == nil)
            {
                callback(NSDictionary(),true)
                return;
            }
            
            if(jsonResult["error"] != nil )
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                    
                }else{
                    
                    let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                    
                    let isSuccess=errorObject["success"]?.boolValue
                    callback(jsonResult,isSuccess!)
                }
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
    func putRequest(functionURL:String,postParams:String,isJson:Bool,callback:(NSDictionary,Bool)->Void)
    {

        let request = NSMutableURLRequest(URL: NSURL(string: functionURL)!)
        request.HTTPMethod = "PUT"
        let postString = postParams
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            
            }
            
        }else{
            
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        self.requests[functionURL] = request
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        

        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
            
           // self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            let httpResponse = response as! NSHTTPURLResponse
            
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }

            if(httpResponse.URL!.absoluteString != functionURL && httpResponse.statusCode > 301 ){
                self.putRequest(httpResponse.URL!.absoluteString , postParams: postParams, isJson: isJson, callback: callback)
            }


            if(responseString=="")
            {
                callback(NSDictionary(),true)

                return;
            }
            
            let jsonResult2: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            if(jsonResult2 == nil)
            {
                callback(NSDictionary(),false)
                return;
            }

            let jsonResult : NSDictionary = (jsonResult2 as?NSDictionary)!;

            
//            if(jsonResult == nil)
//            {
//                callback(NSDictionary(),true)
//                return;
//            }
            
            if(jsonResult["error"] != nil )
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                    
                }else{
                    
                    let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                    
                    let isSuccess=errorObject["success"]?.boolValue
                    callback(jsonResult,isSuccess!)
                }
            }else
            {
                callback(jsonResult,true)
            }

           
        }
        task.resume()
    }

     var taskWillPerformHTTPRedirection: ((NSURLSession, NSURLSessionTask, NSHTTPURLResponse, NSURLRequest) -> NSURLRequest?)?
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, willPerformHTTPRedirection response: NSHTTPURLResponse, newRequest request: NSURLRequest, completionHandler: (NSURLRequest?) -> Void){
        
        
        let originalUrl:String =   (response.URL?.absoluteString)!
       
        let redirectRequest: NSMutableURLRequest =  self.requests[originalUrl]!
        
        redirectRequest.URL = request.URL
        
        completionHandler(redirectRequest)
    }
    
    
    
    //
    /**
    getRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/services/latest/carts/e9486b32-674
    @param callback block called once you got the response
    */
    func getRequestWithoutAuthorization(functionURL:String,postParams:String,callback:(NSDictionary,Bool)->Void)
    {
        
        var endpoint:String = functionURL + postParams
        
        endpoint = endpoint.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let request = NSMutableURLRequest(URL: NSURL(string: endpoint )!)
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        self.requests[functionURL] = request
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
          
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            let httpResponse = response as! NSHTTPURLResponse
            
            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307 ){
                self.getRequest(httpResponse.URL!.absoluteString , postParams: postParams,callback: callback)
                return;
            }
            
            if(data == nil || data?.length <= 0 ){
                
                callback(NSDictionary(),false)
                return;
                
            }
            
            let jsonResult2: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            if(jsonResult2 == nil)
            {
                callback(NSDictionary(),false)
                return;
            }
            
            
            let jsonResult:NSDictionary = (jsonResult2 as? NSDictionary)!
            
            
            
            if(jsonResult["error"] != nil )
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                    
                }else{
                    
                    let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                    
                    let isSuccess=errorObject["success"]?.boolValue
                    callback(jsonResult,isSuccess!)
                }
            }else
            {
                callback(jsonResult,true)
            }
        }
        task.resume()
    }



}