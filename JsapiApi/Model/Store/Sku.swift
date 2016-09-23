//
//	Sku.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Sku:NSObject{

	var active : Bool!
	var catalogId : NSNumber!
	var code : String!
	var skuDescription : String!
	var icon : String!
	var skuId : NSNumber!
	var inventory : AnyObject!
	var minInventoryThreshold : AnyObject!
	var name : String!
	var price : Float!
	var sku : String!
	var startDate : NSNumber!
	var stopDate : NSNumber!
	var virtualCurrencyId : NSNumber!

    open func getActive()->Bool{return active}
    open func getCatalogId()->NSNumber{return catalogId}
    open func getCode()->String{return code}
    open func getDescription()->String{return description}
    open func getIcon()->String{return icon}
    open func getId()->NSNumber{return skuId}
    open func getInventory()->AnyObject{return inventory}
    open func getMinInventoryThreshold()->AnyObject{return minInventoryThreshold}
    open func getName()->String{return name}
    open func getPrice()->Float{return price}
    open func getSku()->String{return sku}
    open func getStartDate()->NSNumber{return startDate}
    open func getStopDate()->NSNumber{return stopDate}
    open func getVirtualCurrencyId()->NSNumber{return virtualCurrencyId}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		active = dictionary["active"] as? Bool
		catalogId = dictionary["catalog_id"] as? NSNumber
		code = dictionary["code"] as? String
		skuDescription = dictionary["description"] as? String
		icon = dictionary["icon"] as? String
		skuId = dictionary["id"] as? NSNumber
		inventory = dictionary["inventory"] as AnyObject!
		minInventoryThreshold = dictionary["min_inventory_threshold"] as AnyObject!
		name = dictionary["name"] as? String
		price = dictionary["price"] as? Float
		sku = dictionary["sku"] as? String
		startDate = dictionary["start_date"] as? NSNumber
		stopDate = dictionary["stop_date"] as? NSNumber
		virtualCurrencyId = dictionary["virtual_currency_id"] as? NSNumber
	}

}
