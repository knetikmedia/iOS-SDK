//
//	Entrie.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Entrie : NSObject{

	public var rank : NSNumber!
	public var score : NSNumber!
	public var userAvatarUrl : String!
	public var userDisplayName : String!
	public var userId : NSNumber!


    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		rank = dictionary["rank"] as? NSNumber
		score = dictionary["score"] as? NSNumber
		userAvatarUrl = dictionary["user_avatar_url"] as? String
		userDisplayName = dictionary["user_display_name"] as? String
		userId = dictionary["user_id"] as? NSNumber
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