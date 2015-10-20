//
//	Cartdetail.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class CartDetails:NSObject{

	var cart : Cart!
	var discounts : AnyObject!
	var items : [Item]!
    
    public func getCart()->Cart
    {
        if(cart == nil ){
        return Cart()
            
        }else{
        return cart
        }
    }
    
    public func getItems()->Array<Item>
    {
        return items
    }
    override public init(){super.init()}
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let cartData = dictionary["cart"] as? NSDictionary{
			cart = Cart(fromDictionary: cartData)
		}
		discounts = dictionary["discounts"] as AnyObject!
		items = [Item]()
		if let itemsArray = dictionary["items"] as? [NSDictionary]{
			for dic in itemsArray{
				let value = Item(fromDictionary: dic)
				items.append(value)
			}
		}
		
	}

}