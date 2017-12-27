//
//	Error.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Error:NSObject{

	open var code : NSNumber!
	open var success : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		code = dictionary["code"] as? NSNumber
		success = dictionary["success"] as? Bool
	}

}
