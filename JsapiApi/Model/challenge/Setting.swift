//
//	Setting.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Setting:NSObject{

	open var key : String!
	open var keyName : String!
	open var value : String!
	open var valueName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		key = dictionary["key"] as? String
		keyName = dictionary["key_name"] as? String
		value = dictionary["value"] as? String
		valueName = dictionary["value_name"] as? String
	}

	
}
