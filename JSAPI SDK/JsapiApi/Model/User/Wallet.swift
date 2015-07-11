//
//	Wallet.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Wallet:NSObject{

	var balance : Double!
	var code : String!
	var currencyName : String!
	var id : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		balance = dictionary["balance"] as? Double
		code = dictionary["code"] as? String
		currencyName = dictionary["currency_name"] as? String
		id = dictionary["id"] as? Int
	}

}