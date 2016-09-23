//
//	Metric.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Metric :NSObject{

    override public init() {
        super.init()
    }
    
	open var activityOccurenceId : NSNumber!
	open var name : String!
	open var tags : [String]!
	open var value : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		activityOccurenceId = dictionary["activity_occurence_id"] as? NSNumber
		name = dictionary["name"] as? String
		tags = dictionary["tags"] as? [String]
		value = dictionary["value"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if activityOccurenceId != nil{
			dictionary["activity_occurence_id"] = activityOccurenceId
		}
		if name != nil{
			dictionary["name"] = name
		}
		if tags != nil{
			dictionary["tags"] = tags
		}
		if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

}
