//
//	Content.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Activity :NSObject{

	open var activityId : NSNumber!
	open var challengeId : NSNumber!
	open var theActivityID : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		activityId = dictionary["activity_id"] as? NSNumber
		challengeId = dictionary["challenge_id"] as? NSNumber
		theActivityID = dictionary["id"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if activityId != nil{
			dictionary["activity_id"] = activityId
		}
		if challengeId != nil{
			dictionary["challenge_id"] = challengeId
		}
		if theActivityID != nil{
			dictionary["id"] = theActivityID
		}
		return dictionary
	}

}
