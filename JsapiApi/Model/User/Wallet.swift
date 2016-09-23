//
//	Wallet.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Wallet:NSObject{

	open var balance : NSNumber!
	open var code : String!
	open var currencyName : String!
	open var wid : NSNumber!
    open var walletId : NSNumber!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		balance = dictionary["balance"] as? NSNumber
		code = dictionary["code"] as? String
		currencyName = dictionary["currency_name"] as? String
		wid = dictionary["id"] as? NSNumber
        walletId = dictionary["wallet_id"] as? NSNumber

	}

}
