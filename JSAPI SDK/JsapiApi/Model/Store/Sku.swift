//
//	Sku.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Sku:NSObject{

	var active : Bool!
	var catalogId : Int!
	var code : String!
	var skuDescription : String!
	var icon : String!
	var id : Int!
	var inventory : AnyObject!
	var minInventoryThreshold : AnyObject!
	var name : String!
	var price : Float!
	var sku : String!
	var startDate : Int!
	var stopDate : Int!
	var virtualCurrencyId : Int!

    public func getActive()->Bool{return active}
    public func getCatalogId()->Int{return catalogId}
    public func getCode()->String{return code}
    public func getDescription()->String{return description}
    public func getIcon()->String{return icon}
    public func getId()->Int{return id}
    public func getInventory()->AnyObject{return inventory}
    public func getMinInventoryThreshold()->AnyObject{return minInventoryThreshold}
    public func getName()->String{return name}
    public func getPrice()->Float{return price}
    public func getSku()->String{return sku}
    public func getStartDate()->Int{return startDate}
    public func getStopDate()->Int{return stopDate}
    public func getVirtualCurrencyId()->Int{return virtualCurrencyId}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		active = dictionary["active"] as? Bool
		catalogId = dictionary["catalog_id"] as? Int
		code = dictionary["code"] as? String
		skuDescription = dictionary["description"] as? String
		icon = dictionary["icon"] as? String
		id = dictionary["id"] as? Int
		inventory = dictionary["inventory"] as AnyObject!
		minInventoryThreshold = dictionary["min_inventory_threshold"] as AnyObject!
		name = dictionary["name"] as? String
		price = dictionary["price"] as? Float
		sku = dictionary["sku"] as? String
		startDate = dictionary["start_date"] as? Int
		stopDate = dictionary["stop_date"] as? Int
		virtualCurrencyId = dictionary["virtual_currency_id"] as? Int
	}

}