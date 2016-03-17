//
//	Catalog.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Catalog:NSObject{

	public var deleted : AnyObject!
	public var displayable : AnyObject!
	public var catalogId : AnyObject!
	public var itemId : NSNumber!
	public var storeEnd : AnyObject!
	public var storeStart : AnyObject!
	public var vendorId : AnyObject!
	public var virtualCurrencyId : AnyObject!
    public var skus : [Sku]!


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