//
//	RootClass.swift
import Foundation

open class JudgeUsersBaseResponse:BaseResponse{

	var count : Int!
	var data : JudgeData!
	var last : Int!
	var size : Int!
	var success : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		count = dictionary["count"] as? Int
		if let dataData = dictionary["data"] as? NSDictionary{
			data = JudgeData(fromDictionary: dataData)
        }else{
            data = JudgeData()
        }
		last = dictionary["last"] as? Int
		size = dictionary["size"] as? Int
		success = dictionary["success"] as? Bool
	}

}
