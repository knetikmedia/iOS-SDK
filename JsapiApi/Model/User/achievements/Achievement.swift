//
//	Achievement.swift
//
//	Create by Youssef on 27/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Achievement : NSObject {

	open var achievementTypeId : NSNumber!
	open var assets : [AnyObject]!
	open var behaviors : [Behavior]!
	open var dateCreated : NSNumber!
	open var dateUpdated : NSNumber!
	open var deleted : NSNumber!
	open var deletedAt : String!
	open var earnedAssetId : String!
	open var geoPolicyId : String!
	open var achievementId : NSNumber!
	open var longDescription : String!
	open var name : String!
	open var related : [AnyObject]!
	open var shortDescription : String!
	open var skus : [AnyObject]!
	open var sort : NSNumber!
	open var terms : [AnyObject]!
	open var typeHNSNumber : String!
	open var unearnedAssetId : String!
	open var uniqueKey : String!
	open var value : NSNumber!


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
