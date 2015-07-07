//
//	Catalog.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Catalog{

	var deleted : AnyObject!
	var displayable : AnyObject!
	var id : AnyObject!
	var itemId : Int!
	var storeEnd : AnyObject!
	var storeStart : AnyObject!
	var vendorId : AnyObject!
	var virtualCurrencyId : AnyObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		deleted = dictionary["deleted"] as AnyObject!
		displayable = dictionary["displayable"] as AnyObject!
		id = dictionary["id"] as AnyObject!
		itemId = dictionary["item_id"] as? Int
		storeEnd = dictionary["store_end"] as AnyObject!
		storeStart = dictionary["store_start"] as AnyObject!
		vendorId = dictionary["vendor_id"] as AnyObject!
		virtualCurrencyId = dictionary["virtual_currency_id"] as AnyObject!
	}
    
}