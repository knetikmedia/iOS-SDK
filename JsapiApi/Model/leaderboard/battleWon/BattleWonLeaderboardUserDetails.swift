//
//	VideoDetail.swift
import Foundation

open class BattleWonLeaderboardUserDetails:NSObject{

	open var avatarUrl : String!
	open var uploaderId : NSNumber!
	open var username : String!
	open var videoId : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarUrl = dictionary["avatarUrl"] as? String
		uploaderId = dictionary["uploaderId"] as? NSNumber
		username = dictionary["username"] as? String
		videoId = dictionary["videoId"] as? NSNumber
	}

}
