//
//	UserResponse.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class UserResponse:BaseResponse{

	var user : User!
	


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		if let userData = dictionary["result"] as? NSDictionary{
			user = User(fromDictionary: userData)
		}
	}

}