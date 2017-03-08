//
//	LeaderboardResponse.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class LeaderboardResponse :BaseResponse{

	var leaderboard : Leaderboard!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		if let resultData = dictionary as? NSDictionary{
			leaderboard = Leaderboard(fromDictionary: resultData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
	
        if leaderboard != nil{
			dictionary = leaderboard.toDictionary() as! NSMutableDictionary
		}
		return dictionary
	}

}
