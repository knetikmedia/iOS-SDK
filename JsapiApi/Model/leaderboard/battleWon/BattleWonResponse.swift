//
//	BattleWonResponse.swift
import Foundation

open class BattleWonResponse:BaseResponse{

	open var count : NSNumber!
	open var battleWonLeaderBoard : [BattleWonLeaderBoard]!
	open var last : NSNumber!
	open var size : NSNumber!
	open var success : Bool!


    public override init() {
        super.init()
        battleWonLeaderBoard = [BattleWonLeaderBoard]()
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		count = dictionary["count"] as? NSNumber
		battleWonLeaderBoard = [BattleWonLeaderBoard]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = BattleWonLeaderBoard(fromDictionary: dic)
				battleWonLeaderBoard.append(value)
			}
		}
		last = dictionary["last"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		success = dictionary["success"] as? Bool
	}

}
