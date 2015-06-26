//
//	Page.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Page{

	var _id : Int!
	var assets : [Asset]!
	var behaviors : [Behavior]!
	var catalogId : Int!
	var dateCreated : Int!
	var dateUpdated : Int!
	var deleted : Int!
	var deletedAt : AnyObject!
	var dimensionUnitOfMeasurement : AnyObject!
	var displayable : Bool!
	var height : AnyObject!
	var id : Int!
	var length : AnyObject!
	var longDescription : String!
	var name : String!
	var related : [Related]!
	var shippingTier : Int!
	var shortDescription : String!
	var skus : [Sku]!
	var sort : Int!
	var storeEnd : Int!
	var storeStart : Int!
	var summary : String!
	var terms : [Int]!
	var typeHint : String!
	var uniqueKey : AnyObject!
	var vendorId : Int!
	var virtualCurrencyId : Int!
	var weight : AnyObject!
	var weightUnitOfMeasurement : AnyObject!
	var width : AnyObject!

    
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["_id"] as? Int
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
		catalogId = dictionary["catalog_id"] as? Int
		dateCreated = dictionary["date_created"] as? Int
		dateUpdated = dictionary["date_updated"] as? Int
		deleted = dictionary["deleted"] as? Int
		deletedAt = dictionary["deleted_at"] as AnyObject!
		dimensionUnitOfMeasurement = dictionary["dimension_unit_of_measurement"] as AnyObject!
		displayable = dictionary["displayable"] as? Bool
		height = dictionary["height"] as AnyObject!
		id = dictionary["id"] as? Int
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
		shippingTier = dictionary["shipping_tier"] as? Int
		shortDescription = dictionary["short_description"] as? String
		skus = [Sku]()
		if let skusArray = dictionary["skus"] as? [NSDictionary]{
			for dic in skusArray{
				let value = Sku(fromDictionary: dic)
				skus.append(value)
			}
		}
		sort = dictionary["sort"] as? Int
		storeEnd = dictionary["store_end"] as? Int
		storeStart = dictionary["store_start"] as? Int
		summary = dictionary["summary"] as? String
		terms = dictionary["terms"] as? [Int]
		typeHint = dictionary["type_hint"] as? String
		uniqueKey = dictionary["unique_key"] as AnyObject!
		vendorId = dictionary["vendor_id"] as? Int
		virtualCurrencyId = dictionary["virtual_currency_id"] as? Int
		weight = dictionary["weight"] as AnyObject!
		weightUnitOfMeasurement = dictionary["weight_unit_of_measurement"] as AnyObject!
		width = dictionary["width"] as AnyObject!
	}
    
    public func get_id() -> Int{return _id}
    public func getAssets() -> Array<Asset>{return assets}
    public func getBehaviors() -> Array<Behavior>{return behaviors}
    public func getCatalogId() -> Int{return catalogId}
    public func getDateCreated() -> Int{return dateCreated}
    public func getDateUpdated() -> Int{return dateUpdated}
    public func getDeleted() -> Int{return deleted}
    public func getDeletedAt() -> AnyObject{return deletedAt}
    public func getDimensionUnitOfMeasurement() -> AnyObject{return dimensionUnitOfMeasurement}
    public func getDisplayable() -> Bool{ return displayable}
    public func getHeight() -> AnyObject{return height}
    public func getId() -> Int{return id}
    public func getLength() -> AnyObject{return length}
    public func getLongDescription() -> String{return longDescription}
    public func getName() -> String{return name}
    public func getRelated() -> Array<Related>{return related}
    public func getShippingTier() -> Int{return shippingTier}
    public func getShortDescription() -> String{return shortDescription}
    public func getSkus() -> Array<Sku>{return skus}
    public func getSort() -> Int{return sort}
    public func getStoreEnd() -> Int{return storeEnd}
    public func getStoreStart() -> Int{return storeStart}
    public func getSummary() -> String{return summary}
    public func getTerms() -> Array<Int>{return terms}
    public func getTypeHint() -> String{return typeHint}
    public func getUniqueKey() -> AnyObject{return uniqueKey}
    public func getVendorId() -> Int{return vendorId}
    public func getVirtualCurrencyId() -> Int{return virtualCurrencyId}
    public func getWeight() -> AnyObject{return weight}
    public func getWeightUnitOfMeasurement() -> AnyObject{return weightUnitOfMeasurement}
    public func getWidth() -> AnyObject{return width}


}