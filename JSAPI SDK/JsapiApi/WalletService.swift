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
    sample request {"reason":"No Reason","userId":29199,"currencyType":"SP","delta":100000,"username":"gt9"}
    *@param params Dictionary
    *@param callback
    *in case of add additions Balance set delta with positive value
    *in case of add deductions Balance set delta with negative value
    *@admin
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
                    callback(Wallet(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    print(result)
                    callback(baseResponse.wallet,"",issuccess)
                    
                }
                
        }
    }


}