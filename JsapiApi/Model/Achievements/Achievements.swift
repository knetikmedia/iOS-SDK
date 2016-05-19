//
//	Content.swift
//
//	Create by Youssef on 19/5/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class Achievements : NSObject{

	public var assets : [AssetContent]!
	public var created : NSNumber!
	public var deleted : NSNumber!
	public var description_str : String!
	public var hidden : NSNumber!
	public var maxValue : NSNumber!
	public var minValue : NSNumber!
	public var name : String!
	public var ruleId : NSNumber!
	public var tags : [String]!
	public var triggerEventName : String!
	public var updated : NSNumber!
    public var achieved : NSNumber!
    public var achievementId : String!
    public var earned : NSNumber!
    public var progress : NSNumber!
    public var userId : NSNumber!
    public var achievement : String!

    override public init(){super.init()
        assets = [AssetContent]()

    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		assets = [AssetContent]()
		if let assetsArray = dictionary["assets"] as? [NSDictionary]{
			for dic in assetsArray{
				let value = AssetContent(fromDictionary: dic)
				assets.append(value)
			}
		}
		created = dictionary["created"] as? NSNumber
		deleted = dictionary["deleted"] as? NSNumber
		description_str = dictionary["description"] as? String
		hidden = dictionary["hidden"] as? NSNumber
		maxValue = dictionary["max_value"] as? NSNumber
		minValue = dictionary["min_value"] as? NSNumber
		name = dictionary["name"] as? String
		ruleId = dictionary["rule_id"] as? NSNumber
		tags = dictionary["tags"] as? [String]
		triggerEventName = dictionary["trigger_event_name"] as? String
		updated = dictionary["updated"] as? NSNumber
        achievementId = dictionary["id"] as? String
        achievement = dictionary["achievement"] as? String
        achieved = dictionary["achieved"] as? NSNumber
        created = dictionary["created"] as? NSNumber
        earned = dictionary["earned"] as? NSNumber
        progress = dictionary["progress"] as? NSNumber
        updated = dictionary["updated"] as? NSNumber
        userId = dictionary["user_id"] as? NSNumber
	}

}