//
//	Data.swift
//
//	Create by Youssef on 16/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class UserAvatarObject : NSObject{

	open var uploaderAvatarUrl : String!
	open var uploaderId : Int!
	open var uploaderUsername : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		uploaderAvatarUrl = dictionary["uploaderAvatarUrl"] as? String
		uploaderId = dictionary["uploaderId"] as? Int
		uploaderUsername = dictionary["uploaderUsername"] as? String
	}

	
}
