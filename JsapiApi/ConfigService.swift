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

open class ConfigService : NSObject
{
    
    open func getConfig(_ configName:String , params:Dictionary<String,AnyObject>,callback:@escaping (Config,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CONFIG
        let methodUrl:String = NSString(format: url as NSString, configName) as String
        
        
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
