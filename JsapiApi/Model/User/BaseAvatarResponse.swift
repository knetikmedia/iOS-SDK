//
//	RootClass.swift
//
//	Create by Youssef on 16/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class BaseAvatarResponse:NSObject{

	open var data : UserAvatarObject!
	open var success : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let dataData = dictionary["data"] as? NSDictionary{
			data = UserAvatarObject(fromDictionary: dataData)
		}
		success = dictionary["success"] as? Bool
	}

	
}
