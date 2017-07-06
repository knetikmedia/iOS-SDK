//
//	Content.swift
//
//	Create by Youssef on 19/5/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Achievements : NSObject{

	open var assets : [AssetContent]!
	open var created : NSNumber!
	open var deleted : NSNumber!
	open var description_str : String!
	open var hidden : NSNumber!
	open var maxValue : NSNumber!
	open var minValue : NSNumber!
	open var name : String!
	open var ruleId : NSNumber!
	open var tags : [String]!
	open var triggerEventName : String!
	open var updated : NSNumber!
    open var achieved : NSNumber!
    open var achievementId : String!
    open var earned : NSNumber!
    open var progress : NSNumber!
    open var userId : NSNumber!
    open var achievement : String!
    open var group_name : String!
    open var order : Order!
    open var title : AchievementTitle!

    override public init(){super.init()
        assets = [AssetContent]()

    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		assets = [AssetContent]()
        let assetsArray = dictionary["additional_properties"] as? NSDictionary
        
        if (assetsArray != nil) {
            
            let earnedDictionary = assetsArray?["earned"] as? NSDictionary
            let unearnedDictionary = assetsArray?["unearned"] as? NSDictionary

            if(unearnedDictionary != nil){
                let unearned = AssetContent(fromDictionary: unearnedDictionary!)
                
                assets.append(unearned)
                
            }

            
            if(earnedDictionary != nil){
                
                let earned = AssetContent(fromDictionary: earnedDictionary!)

            	assets.append(earned)

            }
            
            if let orderData = assetsArray?["order"] as? NSDictionary{
                order = Order(fromDictionary: orderData)
            }
            
            if let titleData = assetsArray?["thetitle"] as? NSDictionary{
                title = AchievementTitle(fromDictionary: titleData)
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
        group_name = dictionary["group_name"] as? String
        
        if let contentArray = dictionary["achievements"] as? [NSDictionary]{
            for dic in contentArray{
                achieved = dic["achieved"] as? NSNumber
                achievement = dic["achievement_name"] as? String

            }
        }

	}

}
