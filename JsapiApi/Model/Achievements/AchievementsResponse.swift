//
//	AchievementsResponse.swift
//
//	Create by Youssef on 19/5/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class AchievementsResponse : BaseResponse{


	var result : AchievementsPage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
		super.init(fromDictionary: dictionary)
        if let resultData = dictionary as? NSDictionary{
			result = AchievementsPage(fromDictionary: resultData)
        }else{
        
            result = AchievementsPage()
        }
	}

}
