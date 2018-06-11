//
//	User.swift
import Foundation

open class UserState :NSObject {

	open var id : String!
	open var createdAt : String!
	open var judges : NSNumber!
	open var likes : NSNumber!
	open var loseVotes : NSNumber!
	open var losestate : NSNumber!
	open var totalBattlesPoints : NSNumber!
	open var totalVotes : NSNumber!
	open var updatedAt : String!
	open var userId : NSNumber!
	open var wonstate : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["_id"] as? String
		createdAt = dictionary["createdAt"] as? String
		judges = dictionary["judges"] as? NSNumber
		likes = dictionary["likes"] as? NSNumber
		loseVotes = dictionary["loseVotes"] as? NSNumber
		losestate = dictionary["losestate"] as? NSNumber
		totalBattlesPoints = dictionary["totalBattlesPoints"] as? NSNumber
		totalVotes = dictionary["totalVotes"] as? NSNumber
		updatedAt = dictionary["updatedAt"] as? String
		userId = dictionary["userId"] as? NSNumber
		wonstate = dictionary["wonstate"] as? NSNumber
	}

}
