//
//	Result.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Config : NSObject{

	open var name : String!
	open var value : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	public init(fromDictionary dictionary: NSDictionary){
		name = dictionary["name"] as? String
		value = dictionary["value"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if name != nil{
			dictionary["name"] = name
		}
		if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

}
