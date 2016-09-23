//
//	CurrencyReward.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class CurrencyReward :NSObject{

	open var currencyId : NSNumber!
	open var currencyName : String!
	open var maxRank : NSNumber!
	open var minRank : NSNumber!
	open var percent : Bool!
	open var value : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		currencyId = dictionary["currency_id"] as? NSNumber
		currencyName = dictionary["currency_name"] as? String
		maxRank = dictionary["max_rank"] as? NSNumber
		minRank = dictionary["min_rank"] as? NSNumber
		percent = dictionary["percent"] as? Bool
		value = dictionary["value"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if currencyId != nil{
			dictionary["currency_id"] = currencyId
		}
		if currencyName != nil{
			dictionary["currency_name"] = currencyName
		}
		if maxRank != nil{
			dictionary["max_rank"] = maxRank
		}
		if minRank != nil{
			dictionary["min_rank"] = minRank
		}
		if percent != nil{
			dictionary["percent"] = percent
		}
		if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

}
