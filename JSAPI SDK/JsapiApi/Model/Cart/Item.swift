//
//	Item.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Item{

	var affiliateId : AnyObject!
	var cartId : Int!
	var cartItemId : Int!
	var catalogId : Int!
	var errorCode : Int!
	var errorMessage : String!
	var inventory : AnyObject!
	var itemUrl : String!
	var name : String!
	var qty : Int!
	var sku : String!
	var skuDescription : String!
	var skuId : Int!
	var stockStatus : String!
	var storeItemId : Int!
	var systemPrice : Float!
	var thumbnail : String!
	var totalPrice : Float!
	var typeHint : String!
	var unitPrice : Float!
	var vendorId : Int!

    public func getAffiliateId ()->AnyObject{return affiliateId}
    public func getCartId ()->Int{return cartId}
    public func getCartItemId ()->Int{return cartItemId }
    public func getCatalogId ()->Int{return catalogId}
    public func getErrorCode ()->Int{return errorCode }
    public func getErrorMessage ()->String{return errorMessage}
    public func getInventory ()->AnyObject{return inventory }
    public func getItemUrl ()->String{return itemUrl}
    public func getName ()->String{return name}
    public func getQty ()->Int{return qty}
    public func getSku ()->String{return sku}
    public func getSkuDescription ()->String{return skuDescription}
    public func getSkuId ()->Int{return skuId}
    public func getStockStatus ()->String{return stockStatus}
    public func getStoreItemId ()->Int{return storeItemId}
    public func getSystemPrice ()->Float{return systemPrice}
    public func getThumbnail ()->String{return thumbnail}
    public func getTotalPrice ()->Float{return totalPrice}
    public func getTypeHint ()->String{return typeHint}
    public func getUnitPrice ()->Float{return unitPrice}
    public func getVendorId ()->Int{return vendorId}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		affiliateId = dictionary["affiliate_id"] as AnyObject!
		cartId = dictionary["cart_id"] as? Int
		cartItemId = dictionary["cart_item_id"] as? Int
		catalogId = dictionary["catalog_id"] as? Int
		errorCode = dictionary["error_code"] as? Int
		errorMessage = dictionary["error_message"] as? String
		inventory = dictionary["inventory"] as AnyObject!
		itemUrl = dictionary["item_url"] as? String
		name = dictionary["name"] as? String
		qty = dictionary["qty"] as? Int
		sku = dictionary["sku"] as? String
		skuDescription = dictionary["sku_description"] as? String
		skuId = dictionary["sku_id"] as? Int
		stockStatus = dictionary["stock_status"] as? String
		storeItemId = dictionary["store_item_id"] as? Int
		systemPrice = dictionary["system_price"] as? Float
		thumbnail = dictionary["thumbnail"] as? String
		totalPrice = dictionary["total_price"] as? Float
		typeHint = dictionary["type_hint"] as? String
		unitPrice = dictionary["unit_price"] as? Float
		vendorId = dictionary["vendor_id"] as? Int
	}

}