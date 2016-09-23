//
//	Item.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Item:NSObject{

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

    open func getAffiliateId ()->AnyObject{return affiliateId}
    open func getCartId ()->NSNumber{return cartId}
    open func getCartItemId ()->NSNumber{return cartItemId }
    open func getCatalogId ()->NSNumber{return catalogId}
    open func getErrorCode ()->NSNumber{return errorCode }
    open func getErrorMessage ()->String{return errorMessage}
    open func getInventory ()->AnyObject{return inventory }
    open func getItemUrl ()->String{return itemUrl}
    open func getName ()->String{return name}
    open func getQty ()->NSNumber{return qty}
    open func getSku ()->String{return sku}
    open func getSkuDescription ()->String{return skuDescription}
    open func getSkuId ()->NSNumber{return skuId}
    open func getStockStatus ()->String{return stockStatus}
    open func getStoreItemId ()->NSNumber{return storeItemId}
    open func getSystemPrice ()->Float{return systemPrice}
    open func getThumbnail ()->String{return thumbnail}
    open func getTotalPrice ()->Float{return totalPrice}
    open func getTypeHNSNumber ()->String{return typeHNSNumber}
    open func getUnitPrice ()->Float{return unitPrice}
    open func getVendorId ()->NSNumber{return vendorId}

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
