//
//	Result.swift
//
//	Create by Youssef on 19/5/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class AchievementsSingleResponse :BaseResponse{

	var content : Achievements!


   /**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
        super.init(fromDictionary: dictionary)
        
        if let resultData = dictionary as? NSDictionary{
            
            content = Achievements(fromDictionary: resultData)
            
        }
		
    }

}
