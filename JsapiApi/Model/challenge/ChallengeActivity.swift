//
//	Result.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class ChallengeActivity :NSObject{

	public var activityId : NSNumber!
	public var challengeId : NSNumber!
	public var entitlement : NSDictionary!
	public var challengeActivityId : NSNumber!
	public var rewardSet : RewardSet!
	public var settings : [Setting]!

    public override init(){
    
    
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		activityId = dictionary["activityId"] as? NSNumber
		challengeId = dictionary["challengeId"] as? NSNumber
		entitlement = dictionary["entitlement"] as? NSDictionary
		challengeActivityId = dictionary["id"] as? NSNumber
		if let rewardSetData = dictionary["rewardSet"] as? NSDictionary{
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