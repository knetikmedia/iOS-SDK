//
//	Wallet.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Wallet:NSObject{

	public var balance : NSNumber!
	public var code : String!
	public var currencyName : String!
	public var wid : NSNumber!
    public var walletId : NSNumber!

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