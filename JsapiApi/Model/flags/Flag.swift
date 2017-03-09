//
//	Content.swift
//
//	Create by Youssef on 30/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Flag :NSObject {

	open var context : String!
	open var contextId : String!
	open var created : NSNumber!
	open var flagId : NSNumber!
	open var reason : String!
	open var updated : NSNumber!
	open var user : SimpleUser!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		context = dictionary["context"] as? String
		contextId = dictionary["context_id"] as? String
		created = dictionary["created"] as? Int as NSNumber!
		flagId = dictionary["id"] as? NSNumber
		reason = dictionary["reason"] as? String
		updated = dictionary["updated"] as? Int as NSNumber!
		if let userData = dictionary["user"] as? NSDictionary{
			user = SimpleUser(fromDictionary: userData)
		}
        
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if context != nil{
			dictionary["context"] = context
		}
		if contextId != nil{
			dictionary["context_id"] = contextId
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
