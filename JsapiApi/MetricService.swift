//
//  MetricService.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation

open class MetricService : NSObject
{

    /**Add a new Metric . Requires user authentication.
    */
    open func addMetric(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDMETRIC;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
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
