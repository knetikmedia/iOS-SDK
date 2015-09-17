//
//  LeaderBoard.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class WalletService:NSObject
{
    
    /** wallet Change
    *@param params Dictionary
    *@param callback
    */

    public func walletChange(params:Dictionary<String,AnyObject>,callback:(Wallet,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.WALLETCHANGE
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=WalletResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.wallet,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    println(result)
                    callback(baseResponse.wallet,"",issuccess)
                    
                }
                
        }
    }


}