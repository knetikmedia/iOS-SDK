//
//	Result.swift
//
//	Create by Youssef on 27/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class Result{

	var achievement : [Achievement]!
	var hasmore : Bool!
	var pageIndex : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		achievement = [Achievement]()
		if let achievementArray = dictionary["achievement"] as? [NSDictionary]{
			for dic in achievementArray{
				let value = Achievement(fromDictionary: dic)
				achievement.append(value)
			}
		}
		hasmore = dictionary["hasmore"] as? Bool
		pageIndex = dictionary["page_index"] as? Int
	}

}