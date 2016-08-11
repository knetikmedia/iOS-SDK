//
//  VideoService.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**

*/

import Foundation

public class ConfigService : NSObject
{
    
    public func getConfig(configName:String , params:Dictionary<String,AnyObject>,callback:(Config,String,Bool)->Void)
    {
        let methodUrl:String = NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CONFIG, configName) as String
        
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                if(!issuccess)
                {
                    let baseResponse=BaseConfigResponse(fromDictionary: result)

                //    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    let baseResponse=BaseConfigResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }

  
   
    
 
}