//
//	GuestUserResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class GuestUserResponse:BaseResponse{

	var guestUser : GuestUser!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		if let guestUserData = dictionary["result"] as? NSDictionary{
			guestUser = GuestUser(fromDictionary: guestUserData)
		}
		
	}

}