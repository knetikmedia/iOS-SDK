//
//	Devicetoken.swift
//
//	Create by Youssef on 15/2/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class Devicetoken : NSObject{

	open var type : String!
	open var value : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		type = dictionary["type"] as? String
		value = dictionary["value"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if type != nil{
			dictionary["type"] = type
		}
		if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

}
