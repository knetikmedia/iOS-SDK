//
//	StrategiesResponse.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class StrategiesResponse:BaseResponse{

	var strategies : [String]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
	
        strategies = dictionary["result"] as? [String]
	}

}