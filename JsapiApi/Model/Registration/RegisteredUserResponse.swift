//
//	RegisteredUserResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class RegisteredUserResponse:BaseResponse{

	var registeredUser : RegisteredUser!
	
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		if let registeredUserData = dictionary as? NSDictionary{
			registeredUser = RegisteredUser(fromDictionary: registeredUserData)
		}
	}

}
