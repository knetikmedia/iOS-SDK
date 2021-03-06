//
//	CartResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class CartResponse :BaseResponse{

	var cartnumber : String!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		cartnumber = dictionary as? String
	}

}
