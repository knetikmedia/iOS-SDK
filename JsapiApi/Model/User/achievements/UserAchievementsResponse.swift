//
//	UserAchievementsResponse.swift
//
//	Create by Youssef on 27/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class UserAchievementsResponse :BaseResponse{

	var achievements : Result!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        
		if let resultData = dictionary as? NSDictionary{
			achievements = Result(fromDictionary: resultData)
		}else
        {
            achievements = Result();
        }
	}

	
}
