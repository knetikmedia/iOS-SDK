//
//	From.swift
//
//	Create by Youssef on 28/1/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Relation : NSObject{

	open var relationshipId : NSNumber!
	open var name : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	public init(fromDictionary dictionary: NSDictionary){
		relationshipId = dictionary["id"] as? Int as NSNumber!
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	open func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if relationshipId != nil{
			dictionary["id"] = relationshipId
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

}
