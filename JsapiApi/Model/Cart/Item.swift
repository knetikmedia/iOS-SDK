//
//	Item.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Item:NSObject{

	var affiliateId : AnyObject!
	var cartId : NSNumber!
	var cartItemId : NSNumber!
	var catalogId : NSNumber!
	var errorCode : NSNumber!
	var errorMessage : String!
	var inventory : AnyObject!
	var itemUrl : String!
	var name : String!
	var qty : NSNumber!
	var sku : String!
	var skuDescription : String!
	var skuId : NSNumber!
	var stockStatus : String!
	var storeItemId : NSNumber!
	var systemPrice : Float!
	var thumbnail : String!
	var totalPrice : Float!
	var typeHNSNumber : String!
	var unitPrice : Float!
	var vendorId : NSNumber!

    public func getAffiliateId ()->AnyObject{return affiliateId}
    public func getCartId ()->NSNumber{return cartId}
    public func getCartItemId ()->NSNumber{return cartItemId }
    public func getCatalogId ()->NSNumber{return catalogId}
    public func getErrorCode ()->NSNumber{return errorCode }
    public func getErrorMessage ()->String{return errorMessage}
    public func getInventory ()->AnyObject{return inventory }
    public func getItemUrl ()->String{return itemUrl}
    public func getName ()->String{return name}
    public func getQty ()->NSNumber{return qty}
    public func getSku ()->String{return sku}
    public func getSkuDescription ()->String{return skuDescription}
    public func getSkuId ()->NSNumber{return skuId}
    public func getStockStatus ()->String{return stockStatus}
    public func getStoreItemId ()->NSNumber{return storeItemId}
    public func getSystemPrice ()->Float{return systemPrice}
    public func getThumbnail ()->String{return thumbnail}
    public func getTotalPrice ()->Float{return totalPrice}
    public func getTypeHNSNumber ()->String{return typeHNSNumber}
    public func getUnitPrice ()->Float{return unitPrice}
    public func getVendorId ()->NSNumber{return vendorId}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		affiliateId = dictionary["affiliate_id"] as AnyObject!
		cartId = dictionary["cart_id"] as? NSNumber
		cartItemId = dictionary["cart_item_id"] as? NSNumber
		catalogId = dictionary["catalog_id"] as? NSNumber
		errorCode = dictionary["error_code"] as? NSNumber
		errorMessage = dictionary["error_message"] as? String
		inventory = dictionary["inventory"] as AnyObject!
		itemUrl = dictionary["item_url"] as? String
		name = dictionary["name"] as? String
		qty = dictionary["qty"] as? NSNumber
		sku = dictionary["sku"] as? String
		skuDescription = dictionary["sku_description"] as? String
		skuId = dictionary["sku_id"] as? NSNumber
		stockStatus = dictionary["stock_status"] as? String
		storeItemId = dictionary["store_item_id"] as? NSNumber
		systemPrice = dictionary["system_price"] as? Float
		thumbnail = dictionary["thumbnail"] as? String
		totalPrice = dictionary["total_price"] as? Float
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
		unitPrice = dictionary["unit_price"] as? Float
		vendorId = dictionary["vendor_id"] as? NSNumber
	}

}