//
//	Catalog.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Catalog:NSObject{

	open var deleted : AnyObject!
	open var displayable : AnyObject!
	open var catalogId : AnyObject!
	open var itemId : NSNumber!
	open var storeEnd : AnyObject!
	open var storeStart : AnyObject!
	open var vendorId : AnyObject!
	open var virtualCurrencyId : AnyObject!
    open var skus : [Sku]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        skus = [Sku]()
        if let skusArray = dictionary["skus"] as? [NSDictionary]{
            for dic in skusArray{
                let value = Sku(fromDictionary: dic)
                skus.append(value)
            }
        }
		deleted = dictionary["deleted"] as AnyObject!
		displayable = dictionary["displayable"] as AnyObject!
		catalogId = dictionary["id"] as AnyObject!
		itemId = dictionary["item_id"] as? NSNumber
		storeEnd = dictionary["store_end"] as AnyObject!
		storeStart = dictionary["store_start"] as AnyObject!
		vendorId = dictionary["vendor_id"] as AnyObject!
		virtualCurrencyId = dictionary["virtual_currency_id"] as AnyObject!
	}
    
}
