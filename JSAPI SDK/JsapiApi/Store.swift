//
//  Store.swift
//  JsapiApi
//
//  Created by youssef on 3/31/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Store
{
    
    public init (){}

    /** get Store Page
    *@param params Dictionary {"terms": [""],"related": [""],"vocabulary": "","limit": 0,"page": 0,"useCatalog": false,"fullObject": false}
    *@param callback
    */
    public func getPage(params:Dictionary<String,AnyObject>,callback:(NSDictionary,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETPAGE;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }


}