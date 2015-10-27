//
//	Achievement.swift
//
//	Create by Youssef on 27/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Achievement : NSObject {

	public var achievementTypeId : NSNumber!
	public var assets : [AnyObject]!
	public var behaviors : [Behavior]!
	public var dateCreated : NSNumber!
	public var dateUpdated : NSNumber!
	public var deleted : NSNumber!
	public var deletedAt : String!
	public var earnedAssetId : String!
	public var geoPolicyId : String!
	public var achievementId : NSNumber!
	public var longDescription : String!
	public var name : String!
	public var related : [AnyObject]!
	public var shortDescription : String!
	public var skus : [AnyObject]!
	public var sort : NSNumber!
	public var terms : [AnyObject]!
	public var typeHNSNumber : String!
	public var unearnedAssetId : String!
	public var uniqueKey : String!
	public var value : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		achievementId = dictionary["_id"] as? NSNumber
		achievementTypeId = dictionary["achievement_type_id"] as? NSNumber
		assets = [AnyObject]()
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
		dateCreated = dictionary["date_created"] as? NSNumber
		dateUpdated = dictionary["date_updated"] as? NSNumber
		deleted = dictionary["deleted"] as? NSNumber
		deletedAt = dictionary["deleted_at"] as? String
		earnedAssetId = dictionary["earned_asset_id"] as? String
		geoPolicyId = dictionary["geo_policy_id"] as? String
		achievementId = dictionary["id"] as? NSNumber
		longDescription = dictionary["long_description"] as? String
		name = dictionary["name"] as? String
		related = [AnyObject]()
		if let relatedArray = dictionary["related"] as? [NSDictionary]{
			for dic in relatedArray{
				let value = Related(fromDictionary: dic)
				related.append(value)
			}
		}
		shortDescription = dictionary["short_description"] as? String
		skus = [AnyObject]()
		if let skusArray = dictionary["skus"] as? [NSDictionary]{
			for dic in skusArray{
				let value = Sku(fromDictionary: dic)
				skus.append(value)
			}
		}
		sort = dictionary["sort"] as? NSNumber
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
		unearnedAssetId = dictionary["unearned_asset_id"] as? String
		uniqueKey = dictionary["unique_key"] as? String
		value = dictionary["value"] as? NSNumber
	}

}