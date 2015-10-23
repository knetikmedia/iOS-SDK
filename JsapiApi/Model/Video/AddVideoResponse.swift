//
//	AddVideoResponse.swift
//
//	Create by Youssef on 7/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class AddVideoResponse :BaseResponse {

	var video : Video!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)

        if let resultData = dictionary["result"] as? NSDictionary{
			video = Video(fromDictionary: resultData)
		}
	}

}