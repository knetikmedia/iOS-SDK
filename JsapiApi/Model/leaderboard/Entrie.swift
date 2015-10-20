//
//	Entrie.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Entrie:NSObject{

	var rank : Int!
	var score : Int!
	var userAvatarUrl : String!
	var userDisplayName : String!
	var userId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		rank = dictionary["rank"] as? Int
		score = dictionary["score"] as? Int
		userAvatarUrl = dictionary["user_avatar_url"] as? String
		userDisplayName = dictionary["user_display_name"] as? String
		userId = dictionary["user_id"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if rank != nil{
			dictionary["rank"] = rank
		}
		if score != nil{
			dictionary["score"] = score
		}
		if userAvatarUrl != nil{
			dictionary["user_avatar_url"] = userAvatarUrl
		}
		if userDisplayName != nil{
			dictionary["user_display_name"] = userDisplayName
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		return dictionary
	}

}