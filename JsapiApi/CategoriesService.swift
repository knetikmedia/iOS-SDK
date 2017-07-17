//
//  CategoriesService.swift
//  JsapiApi
//
//  Created by youssef on 25/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class CategoriesService:NSObject
{

    /**List of Category
    params Dictionary {} Empty
    callback
    */
    open func getCategoriesS(_ params:Dictionary<String,AnyObject>,callback:@escaping (CategoryPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCATEGORIES;
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let catofriesResponse=CategoriesBaseResponse(fromDictionary: result)
                callback(catofriesResponse.result,catofriesResponse.errormessage,issuccess)
        }
    }
    
  
}
