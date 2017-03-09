//
//	Result.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class ChallengeActivity :NSObject{

	open var activityId : NSNumber!
	open var challengeId : NSNumber!
	open var entitlement : NSDictionary!
	open var challengeActivityId : NSNumber!
	open var rewardSet : RewardSet!
	open var settings : [Setting]!

    public override init(){
    
    
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		activityId = dictionary["activity_id"] as? NSNumber
		challengeId = dictionary["challenge_id"] as? NSNumber
		entitlement = dictionary["entitlement"] as? NSDictionary
		challengeActivityId = dictionary["id"] as? NSNumber
		if let rewardSetData = dictionary["reward_set"] as? NSDictionary{
			rewardSet = RewardSet(fromDictionary: rewardSetData)
		}
		settings = [Setting]()
		if let settingsArray = dictionary["settings"] as? [NSDictionary]{
			for dic in settingsArray{
				let value = Setting(fromDictionary: dic)
				settings.append(value)
			}
		}
        
	}

	
}
