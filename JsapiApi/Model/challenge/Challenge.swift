//
//	Content.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class Challenge :NSObject{

	public var activities : NSNumber!
	public var campaignId : NSNumber!
	public var copyOf : NSNumber!
	public var created : NSNumber!
	public var endDate : NSNumber!
	public var challengeId : NSNumber!
	public var leaderboardStrategy : String!
	public var longDescription : String!
	public var name : String!
	public var nextEventDate : NSNumber!
	public var rewardLagMinutes : NSNumber!
	public var rewardSet : RewardSet!
	public var schedule : NSDictionary!
	public var shortDescription : String!
	public var startDate : NSNumber!
	public var updated : NSNumber!
    public var assets : NSDictionary!

    public override init(){}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		activities = dictionary["activities"] as? NSNumber
		campaignId = dictionary["campaignId"] as? NSNumber
		copyOf = dictionary["copyOf"] as? NSNumber
		created = dictionary["created"] as? NSNumber
		endDate = dictionary["endDate"] as? NSNumber
		challengeId = dictionary["id"] as? NSNumber
		leaderboardStrategy = dictionary["leaderboardStrategy"] as? String
		longDescription = dictionary["longDescription"] as? String
		name = dictionary["name"] as? String
		nextEventDate = dictionary["nextEventDate"] as? NSNumber
		rewardLagMinutes = dictionary["rewardLagMinutes"] as? NSNumber
		if let rewardSetData = dictionary["rewardSet"] as? NSDictionary{
			rewardSet = RewardSet(fromDictionary: rewardSetData)
		}
		schedule = dictionary["schedule"] as? NSDictionary
		shortDescription = dictionary["shortDescription"] as? String
		startDate = dictionary["startDate"] as? NSNumber
		updated = dictionary["updated"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if activities != nil{
			dictionary["activities"] = activities
		}
		if campaignId != nil{
			dictionary["campaignId"] = campaignId
		}
		if copyOf != nil{
			dictionary["copyOf"] = copyOf
		}
		if created != nil{
			dictionary["created"] = created
		}
		if endDate != nil{
			dictionary["endDate"] = endDate
		}
		if challengeId != nil{
			dictionary["id"] = challengeId
		}
		if leaderboardStrategy != nil{
			dictionary["leaderboardStrategy"] = leaderboardStrategy
		}
		if longDescription != nil{
			dictionary["longDescription"] = longDescription
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nextEventDate != nil{
			dictionary["nextEventDate"] = nextEventDate
		}
		if rewardLagMinutes != nil{
			dictionary["rewardLagMinutes"] = rewardLagMinutes
		}
		if rewardSet != nil{
			dictionary["rewardSet"] = rewardSet.toDictionary()
		}
		if schedule != nil{
			dictionary["schedule"] = schedule
		}
		if shortDescription != nil{
			dictionary["shortDescription"] = shortDescription
		}
		if startDate != nil{
			dictionary["startDate"] = startDate
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}