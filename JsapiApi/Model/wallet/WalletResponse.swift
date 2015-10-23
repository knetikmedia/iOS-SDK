//
//	WalletResponse.swift
//
//	Create by Youssef on 17/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class WalletResponse :BaseResponse{

	var wallet : Wallet!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        if let resultData = dictionary["result"] as? NSDictionary{
			wallet = Wallet(fromDictionary: resultData)
		}
	}

}