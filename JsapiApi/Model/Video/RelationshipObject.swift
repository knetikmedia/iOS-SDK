//
//	RelationshipdObject.swift
//
//	Create by Youssef on 28/1/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class RelationshipObject:NSObject{

	open var from : Relation!
	open var relationshipId : NSNumber!
	open var relationshipDetails : String!
	open var to : Relation!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let fromData = dictionary["from"] as? NSDictionary{
			from = Relation(fromDictionary: fromData)
		}
		relationshipId = dictionary["id"] as? NSNumber
		relationshipDetails = dictionary["relationship_details"] as? String
        
		if let toData = dictionary["to"] as? NSDictionary{
			to = Relation(fromDictionary: toData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	open func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
        
		if from != nil{
			dictionary["from"] = from.toDictionary()
		}
		if relationshipId != nil{
			dictionary["id"] = relationshipId
		}
		if relationshipDetails != nil{
			dictionary["relationship_details"] = relationshipDetails
		}
		if to != nil{
			dictionary["to"] = to.toDictionary()
		}
		return dictionary
	}

}
