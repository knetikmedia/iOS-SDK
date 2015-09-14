//
//	Result.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Leaderboard:NSObject{

	var created : Int!
	var entries : [Entrie]!
	var id : Int!
	var longDescription : AnyObject!
	var name : AnyObject!
	var shortDescription : AnyObject!
	var strategy : String!
	var updated : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		created = dictionary["created"] as? Int
		entries = [Entrie]()
		if let entriesArray = dictionary["entries"] as? [NSDictionary]{
			for dic in entriesArray{
				let value = Entrie(fromDictionary: dic)
				entries.append(value)
			}
		}
		id = dictionary["id"] as? Int
		longDescription = dictionary["longDescription"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["shortDescription"] as? String
		strategy = dictionary["strategy"] as? String
		updated = dictionary["updated"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if created != nil{
			dictionary["created"] = created
		}
		if entries != nil{
			var dictionaryElements = [NSDictionary]()
			for entriesElement in entries {
				dictionaryElements.append(entriesElement.toDictionary())
			}
			dictionary["entries"] = dictionaryElements
		}
		if id != nil{
			dictionary["id"] = id
		}
		if longDescription != nil{
			dictionary["longDescription"] = longDescription
		}
		if name != nil{
			dictionary["name"] = name
		}
		if shortDescription != nil{
			dictionary["shortDescription"] = shortDescription
		}
		if strategy != nil{
			dictionary["strategy"] = strategy
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}