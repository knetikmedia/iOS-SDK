//
//    Sku.swift
import Foundation

open class Sku : NSObject{

    open var  additionalProperties : GeneralAdditionalPropertie!
    open var  currencyCode : String!
    open var  skuDescription : String!
    open var  inventory : AnyObject!
    open var  minInventoryThreshold : AnyObject!
    open var  notAvailable : Bool!
    open var  notDisplayable : Bool!
    open var  originalPrice : Int!
    open var  price : Int!
    open var  published : Bool!
    open var  saleId : AnyObject!
    open var  saleName : AnyObject!
    open var  sku : String!
    open var  startDate : AnyObject!
    open var  stopDate : AnyObject!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let additionalPropertiesData = dictionary["additional_properties"] as? NSDictionary{
            additionalProperties = GeneralAdditionalPropertie(fromDictionary: additionalPropertiesData)
        }
        currencyCode = dictionary["currency_code"] as? String
        skuDescription = dictionary["description"] as? String
        inventory = dictionary["inventory"] as? AnyObject
        minInventoryThreshold = dictionary["min_inventory_threshold"] as? AnyObject
        notAvailable = dictionary["not_available"] as? Bool
        notDisplayable = dictionary["not_displayable"] as? Bool
        originalPrice = dictionary["original_price"] as? Int
        price = dictionary["price"] as? Int
        published = dictionary["published"] as? Bool
        saleId = dictionary["sale_id"] as? AnyObject
        saleName = dictionary["sale_name"] as? AnyObject
        sku = dictionary["sku"] as? String
        startDate = dictionary["start_date"] as? AnyObject
        stopDate = dictionary["stop_date"] as? AnyObject
    }



}
