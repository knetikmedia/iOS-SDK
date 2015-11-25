//
//  CategoriesService.swift
//  JsapiApi
//
//  Created by youssef on 25/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class CategoriesService:NSObject
{

    /**List of Category
    *@param params Dictionary {} Empty
    *@param callback
    */
    public func getCategoriesS(params:Dictionary<String,AnyObject>,callback:(CategoryPage,String,Bool)->Void)
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