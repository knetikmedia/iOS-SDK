//
//	GetCartResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class GetCartResponse:BaseResponse{

	var cached : Bool!
	var cartdetails : CartDetails!
	var error : Error!
	var message : String!
	var parameters : [AnyObject]!
	var requestId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		cached = dictionary["cached"] as? Bool
		if let cartdetailsData = dictionary as? NSDictionary{
			cartdetails = CartDetails(fromDictionary: cartdetailsData)
		}
	
	}

}
