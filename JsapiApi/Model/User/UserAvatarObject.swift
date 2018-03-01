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
		uploaderAvatarUrl = dictionary["uploader_avatar_url"] as? String
		uploaderId = dictionary["uploader_id"] as? Int
		uploaderUsername = dictionary["uploader_username"] as? String
	}

	
}
