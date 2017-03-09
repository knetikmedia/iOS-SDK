//
//	MainDash.swift
//
//	Create by Youssef on 9/3/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class ChallengeAsset:NSObject{

	open var crc : AnyObject!
	open var maindescription : String!
	open var fileType : String!
	open var type : String!
	open var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		crc = dictionary["crc"] as? AnyObject
		maindescription = dictionary["description"] as? String
		fileType = dictionary["file_type"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if crc != nil{
			dictionary["crc"] = crc
		}
		if maindescription != nil{
			dictionary["description"] = maindescription
		}
		if fileType != nil{
			dictionary["file_type"] = fileType
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
