//
//  Store.swift
//  JsapiApi
//
//  Created by youssef on 3/31/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Store:NSObject
{
    

    /** get Store Page
    *@param params Dictionary {"terms": [""],"related": [""],"vocabulary": "","limit": 0,"page": 0,"useCatalog": false,"fullObject": false}
    *@param callback
    */
    public func getPage(params:Dictionary<String,AnyObject>,callback:(Array<Page>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETPAGE;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let pageResponse=StoreResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(pageResponse.pages,pageResponse.errormessage,issuccess)

                }else
                {
                    callback(pageResponse.pages,"",issuccess)
                }
        }
    }

    public func getVirtualItem(params:Dictionary<String,AnyObject>,callback:(VirtualItemPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.VIRTUALITEMS;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let pageResponse=BaseVirtualItem(fromDictionary: result)
                if(!issuccess)
                {
                    callback(pageResponse.result,pageResponse.errormessage,issuccess)
                    
                }else
                {
                    callback(pageResponse.result,"",issuccess)
                }
        }
    }


}