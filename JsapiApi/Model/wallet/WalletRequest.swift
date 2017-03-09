//
//	WalletRequest.swift
//
//	Create by Youssef on 17/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class WalletRequest :NSObject {

	open var currencyType : String!
	open var delta : NSNumber!
	open var invoiceId : NSNumber!
	open var reason : String!
	open var type : String!
	open var userId : NSNumber!
	open var username : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		currencyType = dictionary["currency_type"] as? String
		delta = dictionary["delta"] as? NSNumber
		invoiceId = dictionary["invoice_id"] as? NSNumber
		reason = dictionary["reason"] as? String
		type = dictionary["type"] as? String
		userId = dictionary["user_id"] as? NSNumber
		username = dictionary["username"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	open func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if currencyType != nil{
			dictionary["currency_type"] = currencyType
		}
		if delta != nil{
			dictionary["delta"] = delta
		}
		if invoiceId != nil{
			dictionary["invoice_id"] = invoiceId
		}
		if reason != nil{
			dictionary["reason"] = reason
		}
		if type != nil{
			dictionary["type"] = type
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		if username != nil{
			dictionary["username"] = username
		}
		return dictionary
	}

}
