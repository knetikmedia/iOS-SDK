//
//	Shippable.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Shippable:NSObject{

	var cartId : NSNumber!
	var shippable : Bool!
    
    public func getCartId()->NSNumber
    {
    return cartId
    }

    public func getShippable()->Bool
    {
        return shippable
    }
    override public init(){super.init()}
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cartId = dictionary["cartId"] as? NSNumber
		shippable = dictionary["shippable"] as? Bool
	}

}