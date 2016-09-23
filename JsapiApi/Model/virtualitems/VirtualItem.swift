//
//	Content.swift
//
//	Create by Youssef on 17/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class VirtualItem :NSObject{

	open var assets : [Asset]!
	open var behaviors : [Behavior]!
	open var catalog : Catalog!
	open var dateCreated : NSNumber!
	open var dateUpdated : NSNumber!
	open var virtualId : NSNumber!
	open var longDescription : String!
	open var name : String!
	open var shortDescription : String!
	open var sort : NSNumber!
	open var summary : String!
	open var typeHNSNumber : String!
	open var uniqueKey : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		assets = [Asset]()
		if let assetsArray = dictionary["assets"] as? [NSDictionary]{
			for dic in assetsArray{
				let value = Asset(fromDictionary: dic)
				assets.append(value)
			}
		}
		behaviors = [Behavior]()
		if let behaviorsArray = dictionary["behaviors"] as? [NSDictionary]{
			for dic in behaviorsArray{
				let value = Behavior(fromDictionary: dic)
				behaviors.append(value)
			}
		}
		if let catalogData = dictionary["catalog"] as? NSDictionary{
			catalog = Catalog(fromDictionary: catalogData)
		}
		dateCreated = dictionary["dateCreated"] as? NSNumber
		dateUpdated = dictionary["dateUpdated"] as? NSNumber
		virtualId = dictionary["id"] as? NSNumber
		longDescription = dictionary["longDescription"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["shortDescription"] as? String
		sort = dictionary["sort"] as? NSNumber
		summary = dictionary["summary"] as? String
		typeHNSNumber = dictionary["typeHNSNumber"] as? String
		uniqueKey = dictionary["uniqueKey"] as? String
	}

}
