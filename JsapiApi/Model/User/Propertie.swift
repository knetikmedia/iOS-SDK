//
//	Propertie.swift
//
//	Create by Youssef on 15/2/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class Propertie : NSObject {

	open var devicetoken : Devicetoken!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let devicetokenData = dictionary["devicetoken"] as? NSDictionary{
			devicetoken = Devicetoken(fromDictionary: devicetokenData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if devicetoken != nil{
			dictionary["devicetoken"] = devicetoken.toDictionary()
		}
		return dictionary
	}

}
