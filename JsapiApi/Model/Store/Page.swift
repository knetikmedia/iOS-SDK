//
//	Page.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Page:NSObject{

	var page_id : NSNumber!
	var assets : [Asset]!
	var behaviors : [Behavior]!
	var catalogId : NSNumber!
	var dateCreated : NSNumber!
	var dateUpdated : NSNumber!
	var deleted : NSNumber!
	var deletedAt : AnyObject!
	var dimensionUnitOfMeasurement : AnyObject!
	var displayable : Bool!
	var height : AnyObject!
	var pageId : NSNumber!
	var length : AnyObject!
	var longDescription : String!
	var name : String!
	var related : [Related]!
	var shippingTier : NSNumber!
	var shortDescription : String!
	var skus : [Sku]!
	var sort : NSNumber!
	var storeEnd : NSNumber!
	var storeStart : NSNumber!
	var summary : String!
	var terms : [NSNumber]!
	var typeHNSNumber : String!
	var uniqueKey : AnyObject!
	var vendorId : NSNumber!
	var virtualCurrencyId : NSNumber!
	var weight : AnyObject!
	var weightUnitOfMeasurement : AnyObject!
	var width : AnyObject!

    
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		pageId = dictionary["_id"] as? NSNumber
		assets = [Asset]()
		if let assetsArray = dictionary["assets"] as? [NSDictionary]{
			for dic in assetsArray{
				let value = Asset(fromDictionary: dic)
				assets.append(value)
			}
		}
		behaviors = [Behavior]()
		if let behaviorsArray = dictionary["behaviors"] as? [NSDictionary]{
			for dic in behaviorsArray{
				let value = Behavior(fromDictionary: dic)
				behaviors.append(value)
			}
		}
		catalogId = dictionary["catalog_id"] as? NSNumber
		dateCreated = dictionary["date_created"] as? NSNumber
		dateUpdated = dictionary["date_updated"] as? NSNumber
		deleted = dictionary["deleted"] as? NSNumber
		deletedAt = dictionary["deleted_at"] as AnyObject!
		dimensionUnitOfMeasurement = dictionary["dimension_unit_of_measurement"] as AnyObject!
		displayable = dictionary["displayable"] as? Bool
		height = dictionary["height"] as AnyObject!
		pageId = dictionary["id"] as? NSNumber
		length = dictionary["length"] as AnyObject!
		longDescription = dictionary["long_description"] as? String
		name = dictionary["name"] as? String
		related = [Related]()
		if let relatedArray = dictionary["related"] as? [NSDictionary]{
			for dic in relatedArray{
				let value = Related(fromDictionary: dic)
				related.append(value)
			}
		}
		shippingTier = dictionary["shipping_tier"] as? NSNumber
		shortDescription = dictionary["short_description"] as? String
		skus = [Sku]()
		if let skusArray = dictionary["skus"] as? [NSDictionary]{
			for dic in skusArray{
				let value = Sku(fromDictionary: dic)
				skus.append(value)
			}
		}
		sort = dictionary["sort"] as? NSNumber
		storeEnd = dictionary["store_end"] as? NSNumber
		storeStart = dictionary["store_start"] as? NSNumber
		summary = dictionary["summary"] as? String
		terms = dictionary["terms"] as? [NSNumber]
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
		uniqueKey = dictionary["unique_key"] as AnyObject!
		vendorId = dictionary["vendor_id"] as? NSNumber
		virtualCurrencyId = dictionary["virtual_currency_id"] as? NSNumber
		weight = dictionary["weight"] as AnyObject!
		weightUnitOfMeasurement = dictionary["weight_unit_of_measurement"] as AnyObject!
		width = dictionary["width"] as AnyObject!
	}
    
    public func get_id() -> NSNumber{return page_id}
    public func getAssets() -> Array<Asset>{return assets}
    public func getBehaviors() -> Array<Behavior>{return behaviors}
    public func getCatalogId() -> NSNumber{return catalogId}
    public func getDateCreated() -> NSNumber{return dateCreated}
    public func getDateUpdated() -> NSNumber{return dateUpdated}
    public func getDeleted() -> NSNumber{return deleted}
    public func getDeletedAt() -> AnyObject{return deletedAt}
    public func getDimensionUnitOfMeasurement() -> AnyObject{return dimensionUnitOfMeasurement}
    public func getDisplayable() -> Bool{ return displayable}
    public func getHeight() -> AnyObject{return height}
    public func getId() -> NSNumber{return pageId}
    public func getLength() -> AnyObject{return length}
    public func getLongDescription() -> String{return longDescription}
    public func getName() -> String{return name}
    public func getRelated() -> Array<Related>{return related}
    public func getShippingTier() -> NSNumber{return shippingTier}
    public func getShortDescription() -> String{return shortDescription}
    public func getSkus() -> Array<Sku>{return skus}
    public func getSort() -> NSNumber{return sort}
    public func getStoreEnd() -> NSNumber{return storeEnd}
    public func getStoreStart() -> NSNumber{return storeStart}
    public func getSummary() -> String{return summary}
    public func getTerms() -> Array<NSNumber>{return terms}
    public func getTypeHNSNumber() -> String{return typeHNSNumber}
    public func getUniqueKey() -> AnyObject{return uniqueKey}
    public func getVendorId() -> NSNumber{return vendorId}
    public func getVirtualCurrencyId() -> NSNumber{return virtualCurrencyId}
    public func getWeight() -> AnyObject{return weight}
    public func getWeightUnitOfMeasurement() -> AnyObject{return weightUnitOfMeasurement}
    public func getWidth() -> AnyObject{return width}


}