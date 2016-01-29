//
//	Content.swift
//
//	Create by Youssef on 26/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Disposition:NSObject{

    override public init(){
    
    }

	public var context : String!
	public var contextId : NSNumber!
	public var created : NSNumber!
	public var dispositionId : NSNumber!
	public var name : String!
	public var updated : NSNumber!
	public var user : SimpleUser!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		context = dictionary["context"] as? String
		contextId = dictionary["contextId"] as? NSNumber
		created = dictionary["created"] as? NSNumber
		dispositionId = dictionary["id"] as? NSNumber
		name = dictionary["name"] as? String
		updated = dictionary["updated"] as? NSNumber
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
			dictionary["contextId"] = contextId
		}
		if created != nil{
			dictionary["created"] = created
		}
		if dispositionId != nil{
			dictionary["id"] = dispositionId
		}
		if name != nil{
			dictionary["name"] = name
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