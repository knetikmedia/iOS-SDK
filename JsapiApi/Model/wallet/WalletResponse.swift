//
//	WalletResponse.swift
//
//	Create by Youssef on 17/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class WalletResponse :BaseResponse{

	public var wallets : [Wallet]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
        super.init(fromDictionary: dictionary)
        wallets = [Wallet]()
        
        if let resultArray = dictionary["result"] as? [NSDictionary]{
            for dic in resultArray{
                let value = Wallet(fromDictionary: dic)
                wallets.append(value)
            }
        }
      	}

}