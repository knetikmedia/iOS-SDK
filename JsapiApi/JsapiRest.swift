//
//  JsapiRest.swift
//  JsapiApi
//
//  Created by youssef on 3/12/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

class JsapiRest :NSObject,URLSessionDelegate
{
    
    private static var __once: () = {
                Statics.instance=JsapiRest()
                
        }()
    
    fileprivate var requests:Dictionary<String,NSMutableURLRequest> = Dictionary<String,NSMutableURLRequest>()

    struct Statics
    {
        static var instance:JsapiRest?
        static var token:Int=0
        
    }
    
    class var sharedInstance:JsapiRest
    {
       
        _ = JsapiRest.__once
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
    func postrequest(_ functionURL:String,postParams:String,isJson:Bool,callback:@escaping (NSDictionary,Bool)->Void)
    {
        
        let request = NSMutableURLRequest(url: URL(string: functionURL)!)
        
        request.httpMethod = "POST"
        let postString = postParams
        request.httpBody = postString.data(using: String.Encoding.utf8)
        if(isJson)
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            
        if(!JsapiAPi.sharedInstance.getJsapiOriginalToken().isEmpty &&
            JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR
            && !functionURL.contains("google")
            )
            {
                request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            }

        }else{
            
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        self.requests[functionURL] = request
        
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
     
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                
                callback(res,false)
                return
            }
            //self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
           
            let httpResponse = response as! HTTPURLResponse
            
            
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
            let jsonResult2: AnyObject! = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers ) as AnyObject!
            
            if(jsonResult2 == nil ){

                callback(NSDictionary(),false)
                
            return
            }

            if jsonResult2 is NSArray{

                 var responseResult =  Dictionary<String,NSArray>()
                responseResult["result"] = jsonResult2 as! NSArray
                callback(responseResult as NSDictionary,true)
                return;
            }

            let jsonResult : NSDictionary = (jsonResult2 as?NSDictionary)!;
            
            
            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307){
                
                self.postrequest(httpResponse.url!.absoluteString , postParams: postParams, isJson: isJson, callback: callback)
            }
            
           

            if(jsonResult["error"] != nil && isJson)
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                }
                
                if jsonResult["error"] is Dictionary<String,Bool>{
                let errorObject = jsonResult["error"] as! Dictionary<String,Bool>
                
                let isSuccess=errorObject["success"]
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
                if(jsonResult["error"] != nil || httpResponse.statusCode >= 400)
                {
                    callback(jsonResult,false)
                    
                }else
                {
                    callback(jsonResult,true)
            }
        }) 
        task.resume()
    }

    
    
    //
    /**
    getRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/services/latest/carts/e9486b32-674
    @param callback block called once you got the response
    */
    func getRequest(_ functionURL:String,postParams:String,callback:@escaping (NSDictionary,Bool)->Void)
    {

        var endpoint:String = functionURL + postParams

        endpoint = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let request = NSMutableURLRequest(url: URL(string: endpoint )!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){
            
            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            
        }

         self.requests[functionURL] = request
        
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            if error != nil {
                
                let res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
           
      
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            let httpResponse = response as! HTTPURLResponse

            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307 ){
                self.getRequest(httpResponse.url!.absoluteString , postParams: postParams,callback: callback)
                return;
            }

            if(data == nil || data?.count <= 0 ){
            
                callback(NSDictionary(),(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 ))
                return;

            }
            
            let jsonResult2: AnyObject! = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject!

            if(jsonResult2 == nil)
            {
                callback(NSDictionary(),false)
                return;
            }

            var jsonResult:NSDictionary = NSDictionary();
            
            if jsonResult2 is Array<Any> {
                
                jsonResult = ["result":jsonResult2]
                
                callback(jsonResult as! NSDictionary,false)

                
            }else{
                
                jsonResult = (jsonResult2 as? NSDictionary)!
                
            }
            
            
            
            if(jsonResult["error"] != nil || httpResponse.statusCode >= 400)
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                 JsapiAPi.sharedInstance.sessionExpired()
                    
                   callback(jsonResult,false)
                    
                }else{
                    
                    if ((jsonResult["error"] as? NSDictionary) != nil) {
                        
                        let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                        
                        let isSuccess=errorObject["success"]
                        callback(jsonResult,isSuccess!)
                    }else{
                        
                        callback(jsonResult,false)
                        
                    }

                }
            }else
             {
                    callback(jsonResult,true)
            }
        }) 
        task.resume()
    }

    
    
    
    //
    /**
    DELETERequet
    @param functionURL : function URL Example
    @param callback block called once you got the response
    */
    func deleteRequest(_ functionURL:String,deleteParams:String,callback:@escaping (NSDictionary,Bool)->Void)
    {

        let request = NSMutableURLRequest(url: URL(string: functionURL)!)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if(!JsapiAPi.sharedInstance.getJsapiToken().isEmpty&&JsapiAPi.sharedInstance.getJsapiToken() != JSAPIConstant.TOKENBREAR){

            request.setValue(JsapiAPi.sharedInstance.getJsapiToken(),forHTTPHeaderField:"Authorization")
            
        }
        
        self.requests[functionURL] = request
        
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)

        
        let task = session.dataTask(with: request  as URLRequest, completionHandler: {
            data, response, error in
            
            
            if error != nil {
                
                var res = NSMutableDictionary();
                
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
            
            let httpResponse = response as! HTTPURLResponse

            
           // self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }
        
            let jsonResult: NSDictionary! = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers ) as? NSDictionary
            
            if(httpResponse.url!.absoluteString != functionURL && httpResponse.statusCode > 301 ){
                self.deleteRequest(httpResponse.url!.absoluteString , deleteParams: deleteParams, callback: callback)
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
                    
                    if ((jsonResult["error"] as? NSDictionary) != nil) {
                    
                        let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>

                        let isSuccess=errorObject["success"]
                        callback(jsonResult,isSuccess!)
                    }else{
                    
                        callback(jsonResult,false)

                    }
                    
                
                }
            }else
            {
                callback(jsonResult,true)
            }

        }) 
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
    func putRequest(_ functionURL:String,postParams:String,isJson:Bool,callback:@escaping (NSDictionary,Bool)->Void)
    {

        let request = NSMutableURLRequest(url: URL(string: functionURL)!)
        request.httpMethod = "PUT"
        let postString = postParams
        request.httpBody = postString.data(using: String.Encoding.utf8)
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
        
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        

        
        let task = session.dataTask(with: request  as URLRequest , completionHandler: {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
            
           // self.requests.removeValueForKey(request.URL!.absoluteString)
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            let httpResponse = response as! HTTPURLResponse
            
            
            if(httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 && (responseString as! String) .isEmpty)
            {
                callback(NSDictionary(),true)
                
                return
            }

            if(httpResponse.url!.absoluteString != functionURL && httpResponse.statusCode > 301 ){
                self.putRequest(httpResponse.url!.absoluteString , postParams: postParams, isJson: isJson, callback: callback)
            }


            if(responseString=="")
            {
                callback(NSDictionary(),true)

                return;
            }
            
            let jsonResult2: AnyObject! = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject!
            
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
            
            if(jsonResult["error"] != nil || ( jsonResult["code"] != nil && jsonResult["code"] as?Int != 0 ) )
            {
                if(jsonResult ["error"] as?String == "invalid_token") {
                    
                    JsapiAPi.sharedInstance.sessionExpired()
                    
                    callback(jsonResult,false)
                    
                }else{
                    
                    if ((jsonResult["error"] as? NSDictionary) != nil) {
                        
                        let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                        
                        let isSuccess=errorObject["success"]
                        callback(jsonResult,isSuccess!)
                    }else{
                        
                        callback(jsonResult,false)
                        
                    }

                }
            }else
            {
                callback(jsonResult,true)
            }

           
        }) 
        task.resume()
    }

     var taskWillPerformHTTPRedirection: ((Foundation.URLSession, URLSessionTask, HTTPURLResponse, URLRequest) -> URLRequest?)?
    
    func URLSession(_ session: Foundation.URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: (URLRequest?) -> Void){
        
        
        let originalUrl:String =   (response.url?.absoluteString)!
       
        let redirectRequest: NSMutableURLRequest =  self.requests[originalUrl]!
        
        redirectRequest.url = request.url
        
        completionHandler(redirectRequest as URLRequest)
    }
    
    
    
    //
    /**
    getRequet
    @param functionURL : function URL Example http://localhost:8080/jsapi/services/latest/carts/e9486b32-674
    @param callback block called once you got the response
    */
    func getRequestWithoutAuthorization(_ functionURL:String,postParams:String,callback:@escaping (NSDictionary,Bool)->Void)
    {
        
        var endpoint:String = functionURL + postParams
        
        endpoint = endpoint.replacingOccurrences(of: " ", with: "%20")
        
        let request = NSMutableURLRequest(url: URL(string: endpoint )!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        self.requests[functionURL] = request
        
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            if error != nil {
                
                var res = NSMutableDictionary();
                res.setValue(JSAPIConstant.CONNECTION_ERROR, forKey: "message")
                callback(res,false)

                return
            }
          
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            let httpResponse = response as! HTTPURLResponse
            
            if(httpResponse.statusCode == 301 || httpResponse.statusCode == 307 ){
                self.getRequest(httpResponse.url!.absoluteString , postParams: postParams,callback: callback)
                return;
            }
            
            if(data == nil || data?.count <= 0 ){
                
                callback(NSDictionary(),false)
                return;
                
            }
            
            let jsonResult2: AnyObject! = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject!
            
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
                    
                    if ((jsonResult["error"] as? NSDictionary) != nil) {
                        
                        let errorObject = jsonResult["error"]  as! Dictionary<String,Bool>
                        
                        let isSuccess=errorObject["success"]
                        callback(jsonResult,isSuccess!)
                    }else{
                        
                        callback(jsonResult,false)
                        
                    }

                                    }
            }else
            {
                callback(jsonResult,true)
            }
        }) 
        task.resume()
    }



}
