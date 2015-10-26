//
//	Result.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Leaderboard:NSObject{

    override public init(){super.init()}
	public var created : NSNumber!
	public var entries : [Entrie]!
	public var leaderboardId : NSNumber!
	public var longDescription : AnyObject!
	public var name : AnyObject!
	public var shortDescription : AnyObject!
	public var strategy : String!
	public var updated : NSNumber!


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
		longDescription = dictionary["longDescription"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["shortDescription"] as? String
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