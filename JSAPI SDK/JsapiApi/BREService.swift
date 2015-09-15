//
//  Cart.swift
//  JsapiApi
//
//  Created by youssef on 3/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class BREService:NSObject
{
    
   
    public func createBRE(params:Dictionary<String,AnyObject>,callback:(Array<String>,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CARTSSKU
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var skuResponse=CartSKUResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Array<String>(),skuResponse.errormessage,issuccess)
                }else
                {
                    //  callback(skuResponse.cartsku.skus,"",issuccess)
                }
        }
    }
    
}