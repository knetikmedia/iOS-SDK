//
//	Result.swift
//
//	Create by Youssef on 19/5/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class AchievementsPage :NSObject{

	public var content : [Achievements]!
	public var first : NSNumber!
	public var last : NSNumber!
	public var number : NSNumber!
	public var numberOfElements : NSNumber!
	public var size : NSNumber!
	public var totalElements : NSNumber!
	public var totalPages : NSNumber!

    override public init(){super.init()
    
        content = [Achievements]()
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = [Achievements]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = Achievements(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? NSNumber
		last = dictionary["last"] as? NSNumber
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["numberOfElements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["totalElements"] as? NSNumber
		totalPages = dictionary["totalPages"] as? NSNumber
	}

}