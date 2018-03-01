//
//  LevelService.swift
//  JsapiApi
//
//  Created by youssef on 25/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class LevelService:NSObject
{

    /**List of LevelService
    params Dictionary {} Empty
    callback
    */
    open func getLevelDetails(_ params:Dictionary<String,AnyObject>,userId:String,levelName:String,callback:@escaping (LevelProgress,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.LEVELPROGRESS

        let methodUrl:String = NSString(format: url as NSString,userId,levelName) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let levelProgress=LevelProgress(fromDictionary: result)
                callback(levelProgress,levelProgress.errormessage,issuccess)
        }
    }
   
  
}
