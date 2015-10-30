//
//	Content.swift
//
//	Create by Youssef on 30/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Flag :NSObject {

	public var context : String!
	public var contextId : String!
	public var created : NSNumber!
	public var flagId : NSNumber!
	public var reason : String!
	public var updated : NSNumber!
	public var user : SimpleUser!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		context = dictionary["context"] as? String
		contextId = dictionary["contextId"] as? String
		created = dictionary["created"] as? Int
		flagId = dictionary["id"] as? NSNumber
		reason = dictionary["reason"] as? String
		updated = dictionary["updated"] as? Int
		if let userData = dictionary["user"] as? NSDictionary{
			user = SimpleUser(fromDictionary: userData)
		}
        
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if context != nil{
			dictionary["context"] = context
		}
		if contextId != nil{
			dictionary["contextId"] = contextId
		}
		if created != nil{
			dictionary["created"] = created
		}
		if flagId != nil{
			dictionary["id"] = flagId
		}
		if reason != nil{
			dictionary["reason"] = reason
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		if user != nil{
			dictionary["user"] = user.toDictionary()
		}
		return dictionary
	}

}