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
    /*Get Category by id*/
    open func getCategorieyById(_ params:Dictionary<String,AnyObject>,categortyId:NSString,callback:@escaping (CategoryObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCATEGORIES+"/"+(categortyId as String);
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            let catofriesResponse=CategoryObject(fromDictionary: result)
            callback(catofriesResponse,catofriesResponse.errormessage,issuccess)
        }
    }


    open func getJudgedCategories(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<JudgedBy>,String,Bool)->Void)
    {

        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.JUDGEDCATEGORIES

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
                let baseResponse=JudgeUsersBaseResponse(fromDictionary: result)

                callback(baseResponse.data.judgedBy,baseResponse.errormessage,issuccess)

            }else
            {
                let baseResponse=JudgeUsersBaseResponse(fromDictionary: result )

                callback(baseResponse.data.judgedBy,"",issuccess)

            }

        }
    }
  
}
