//
//	Data.swift
import Foundation

open class BattleWonLeaderBoard:NSObject{

	open var id : String!
	open var totalCount : NSNumber!
	open var battleWonLeaderboardUserDetails : BattleWonLeaderboardUserDetails!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["_id"] as? String
		totalCount = dictionary["totalCount"] as? NSNumber
		if let videoDetailsData = dictionary["videoDetails"] as? NSDictionary{
			battleWonLeaderboardUserDetails = BattleWonLeaderboardUserDetails(fromDictionary: videoDetailsData)
		}
	}

}
