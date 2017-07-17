//
//  Store.swift
//  JsapiApi
//
//  Created by youssef on 3/31/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class StoreService:NSObject
{
    

    /** get Store Page
    Dictionary {"terms": [""],"related": [""],"vocabulary": "","limit": 0,"page": 0,"useCatalog": false,"fullObject": false}
    */
    open func getPage(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Page>,String,Bool)->Void)
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

    open func getVirtualItem(_ params:Dictionary<String,AnyObject>,callback:@escaping (VirtualItemPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.VIRTUALITEMS;
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
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
    
    
    open func getVirtualItemAssets(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<VirtualItemResultsAssets>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGESBATCH
        
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseVirtualItemsWithAssets(fromDictionary: result)
                
                if(!issuccess)
                {
                    
                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }



}
