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
    
    public func GetUserWallet(userId:String,params:Dictionary<String,AnyObject>,callback:(Array<Wallet>,String,Bool)->Void)
    {
        let methodUrl:String = NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERWALLETS,userId) as String

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            let baseResponse=WalletResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(baseResponse.wallets,baseResponse.errormessage,issuccess)
                
            }else
            {
                callback(baseResponse.wallets,"",issuccess)
                
            }
            
        }
    }


}