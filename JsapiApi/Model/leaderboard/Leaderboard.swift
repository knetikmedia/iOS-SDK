//
//	Result.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Leaderboard:NSObject{

    override public init(){super.init()}
	open var created : NSNumber!
	open var entries : [Entrie]!
	open var leaderboardId : NSNumber!
	open var longDescription : AnyObject!
	open var name : AnyObject!
	open var shortDescription : AnyObject!
	open var strategy : String!
	open var updated : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		created = dictionary["created"] as? NSNumber
		entries = [Entrie]()
		if let entriesArray = dictionary["entries"] as? [NSDictionary]{
			for dic in entriesArray{
				let value = Entrie(fromDictionary: dic)
				entries.append(value)
			}
		}
		leaderboardId = dictionary["id"] as? NSNumber
		longDescription = dictionary["long_description"] as? String as AnyObject!
		name = dictionary["name"] as? String as AnyObject!
		shortDescription = dictionary["short_description"] as? String as AnyObject!
		strategy = dictionary["strategy"] as? String
		updated = dictionary["updated"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
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
		if leaderboardId != nil{
			dictionary["id"] = leaderboardId
		}
		if longDescription != nil{
			dictionary["long_description"] = longDescription
		}
		if name != nil{
			dictionary["name"] = name
		}
		if shortDescription != nil{
			dictionary["short_description"] = shortDescription
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
