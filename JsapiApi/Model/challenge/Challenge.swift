//
//	Content.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Challenge :NSObject{

	open var activities : NSNumber!
	open var campaignId : NSNumber!
	open var copyOf : NSNumber!
	open var created : NSNumber!
	open var endDate : NSNumber!
	open var challengeId : NSNumber!
	open var leaderboardStrategy : String!
	open var longDescription : NSNumber!
	open var name : String!
	open var nextEventDate : NSNumber!
	open var rewardLagMinutes : NSNumber!
	open var rewardSet : RewardSet!
	open var schedule : NSDictionary!
	open var shortDescription : String!
	open var startDate : NSNumber!
	open var updated : NSNumber!
    open var assets : NSDictionary!
    var additionalProperties : ChallengeAdditionalPropertie!

    public override init(){}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		activities = dictionary["activities"] as? NSNumber
		campaignId = dictionary["campaign_id"] as? NSNumber
		copyOf = dictionary["copy_of"] as? NSNumber
		created = dictionary["created_date"] as? NSNumber
		endDate = dictionary["end_date"] as? NSNumber
		challengeId = dictionary["id"] as? NSNumber
		leaderboardStrategy = dictionary["leaderboard_strategy"] as? String
        
        let longValue = dictionary["long_description"] as? String
        
        if let number = Int(longValue!){
        
            longDescription = Int(longValue!) as NSNumber!
        }else{
        
            longDescription = 500
        }
        
		name = dictionary["name"] as? String
		nextEventDate = dictionary["next_event_date"] as? NSNumber
		rewardLagMinutes = dictionary["reward_lag_minutes"] as? NSNumber
		if let rewardSetData = dictionary["reward_set"] as? NSDictionary{
			rewardSet = RewardSet(fromDictionary: rewardSetData)
		}
		schedule = dictionary["schedule"] as? NSDictionary
		shortDescription = dictionary["short_description"] as? String
		startDate = dictionary["start_date"] as? NSNumber
		updated = dictionary["updated"] as? NSNumber
        
       	if let additionalPropertiesData = dictionary["additional_properties"] as? NSDictionary{
            additionalProperties = ChallengeAdditionalPropertie(fromDictionary: additionalPropertiesData)
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if activities != nil{
			dictionary["activities"] = activities
		}
		if campaignId != nil{
			dictionary["campaign_id"] = campaignId
		}
		if copyOf != nil{
			dictionary["copy_of"] = copyOf
		}
		if created != nil{
			dictionary["created_date"] = created
		}
		if endDate != nil{
			dictionary["end_date"] = endDate
		}
		if challengeId != nil{
			dictionary["id"] = challengeId
		}
		if leaderboardStrategy != nil{
			dictionary["leaderboard_strategy"] = leaderboardStrategy
		}
		if longDescription != nil{
			dictionary["long_description"] = longDescription
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nextEventDate != nil{
			dictionary["next_event_date"] = nextEventDate
		}
		if rewardLagMinutes != nil{
			dictionary["rewardLag_minutes"] = rewardLagMinutes
		}
		if rewardSet != nil{
			dictionary["reward_set"] = rewardSet.toDictionary()
		}
		if schedule != nil{
			dictionary["schedule"] = schedule
		}
		if shortDescription != nil{
			dictionary["short_description"] = shortDescription
		}
		if startDate != nil{
			dictionary["start_date"] = startDate
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}
