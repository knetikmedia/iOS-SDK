//
//	UserRankResponse.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class UserRankResponse:BaseResponse{

	var rank : Entrie!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        if let resultData = dictionary["result"] as? NSDictionary{
			rank = Entrie(fromDictionary: resultData)
		}
	}

	
}