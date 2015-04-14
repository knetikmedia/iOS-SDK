//
//	Shippable.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Shippable{

	var cartId : Int!
	var shippable : Bool!
    
    public func getCartId()->Int
    {
    return cartId
    }

    public func getShippable()->Bool
    {
        return shippable
    }
    init(){}
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cartId = dictionary["cartId"] as? Int
		shippable = dictionary["shippable"] as? Bool
	}

}