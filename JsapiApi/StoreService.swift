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

    open func getItemDetails(_ params:Dictionary<String,AnyObject>,itemId:String,callback:@escaping (Item,String,Bool)->Void)
    {

        let url:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ITEMDETAILS

        let methodUrl:String=NSString(format: url as NSString ,itemId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in

                if(!issuccess)
                {
                    callback(Item(),"",issuccess)
                    
                }else
                {
                    let item=Item(fromDictionary: result)

                    callback(item,"",issuccess)
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


    open func quickBuy(_ params:Dictionary<String,String>,callback:@escaping (NSDictionary,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.QUICK_BUY

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
        {
            (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
                callback(result,"",issuccess)
            }else
            {
                callback(result,"",issuccess)
            }
        }
    }

    /*
        this function doing item check
        it's check if the user already bought this item or not
     */
    open func itemAccessCheck(_ params:Dictionary<String,AnyObject>,itemId:String,callback:@escaping (NSDictionary,String,Bool)->Void)
    {

        let url:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ITEMCHECK

        let methodUrl:String=NSString(format: url as NSString ,itemId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in

            if(!issuccess)
            {
                callback(result,"",issuccess)

            }else
            {
                callback(result,"",issuccess)
            }
        }
    }

}
