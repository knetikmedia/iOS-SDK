//
//  LeaderBoard.swift
//  JsapiApi
//
//  Created by youssef on 9/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class WalletService:NSObject
{
    
    open func GetUserWallet(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (Array<Wallet>,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERWALLETS
        let methodUrl:String = NSString(format:url as NSString ,userId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
                callback( [Wallet](),"",issuccess)
                
            }else
            {
                let baseResponse=WalletResponse(fromDictionary: result)

                callback(baseResponse.wallets,"",issuccess)
                
            }
            
        }
    }


}
