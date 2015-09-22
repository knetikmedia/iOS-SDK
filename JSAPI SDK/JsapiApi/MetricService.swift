//
//  MetricService.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation

public class MetricService : NSObject
{

    /**Add a new Metric . Requires user authentication.
    *@param params Dictionary
    *@param callback
    */
    public func addMetric(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDMETRIC;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse,"",issuccess)
                    
                }
                
        }
    }




}