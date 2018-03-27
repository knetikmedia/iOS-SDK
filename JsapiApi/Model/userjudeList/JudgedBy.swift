//
//	JudgedBy.swift
import Foundation

open class JudgedBy: NSObject{

	open var id : String!
	open var judgeCount : NSNumber!
    open var totalVotes : NSNumber!
	open var userId : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["_id"] as? String
		judgeCount = dictionary["judgeCount"] as? NSNumber
        totalVotes = dictionary["totalVotes"] as? NSNumber
		userId = dictionary["userId"] as? NSNumber
	}

}
