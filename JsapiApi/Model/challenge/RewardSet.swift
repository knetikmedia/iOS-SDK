//
//	RewardSet.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class RewardSet :NSObject{

	open var created : NSNumber!
	open var currencyRewards : [CurrencyReward]!
	open var rewardSetId : NSNumber!
	open var itemRewards : [NSDictionary]!
	open var longDescription : String!
	open var maxPlacing : NSNumber!
	open var name : String!
	open var shortDescription : String!
	open var uniqueKey : String!
	open var updated : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		created = dictionary["created"] as? NSNumber
		currencyRewards = [CurrencyReward]()
		if let currencyRewardsArray = dictionary["currency_rewards"] as? [NSDictionary]{
			for dic in currencyRewardsArray{
				let value = CurrencyReward(fromDictionary: dic)
				currencyRewards.append(value)
			}
		}
		rewardSetId = dictionary["id"] as? NSNumber
		itemRewards = [NSDictionary]()
		if let itemRewardsArray = dictionary["item_rewards"] as? [NSDictionary]{
			for dic in itemRewardsArray{
				let value =  dic
				itemRewards.append(value)
			}
		}
		longDescription = dictionary["long_description"] as? String
		maxPlacing = dictionary["max_placing"] as? NSNumber
		name = dictionary["name"] as? String
		shortDescription = dictionary["short_description"] as? String
		uniqueKey = dictionary["unique_key"] as? String
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
		if currencyRewards != nil{
			var dictionaryElements = [NSDictionary]()
			for currencyRewardsElement in currencyRewards {
				dictionaryElements.append(currencyRewardsElement.toDictionary())
			}
			dictionary["currency_rewards"] = dictionaryElements
		}
		if rewardSetId != nil{
			dictionary["id"] = rewardSetId
		}
		if itemRewards != nil{
			var dictionaryElements = [NSDictionary]()
			for itemRewardsElement in itemRewards {
				dictionaryElements.append(itemRewardsElement)
			}
			dictionary["item_rewards"] = dictionaryElements
		}
		if longDescription != nil{
			dictionary["long_description"] = longDescription
		}
		if maxPlacing != nil{
			dictionary["max_placing"] = maxPlacing
		}
		if name != nil{
			dictionary["name"] = name
		}
		if shortDescription != nil{
			dictionary["short_description"] = shortDescription
		}
		if uniqueKey != nil{
			dictionary["unique_key"] = uniqueKey
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}
