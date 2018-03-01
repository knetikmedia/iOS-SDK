//
//	Shippable.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Shippable:NSObject{

	var cartId : NSNumber!
	var shippable : Bool!
    
    open func getCartId()->NSNumber
    {
    return cartId
    }

    open func getShippable()->Bool
    {
        return shippable
    }
    override public init(){super.init()}
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cartId = dictionary["cart_id"] as? NSNumber
		shippable = dictionary["shippable"] as? Bool
	}

}
