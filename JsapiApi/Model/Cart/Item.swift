//
//    Item.swift
import Foundation

open class Item :NSObject {

    open var   additionalProperties : GeneralAdditionalPropertie!
    open var  behaviors : [Behavior]!
    open var  category : AnyObject!
    open var  createdDate : Int!
    open var  displayable : Bool!
    open var  geoCountryList : [AnyObject]!
    open var  geoPolicyType : AnyObject!
    open var  id : Int!
    open var  longDescription : String!
    open var  name : String!
    open var  shippingTier : Int!
    open var  shortDescription : String!
    open var  skus : [Sku]!
    open var  sort : Int!
    open var  storeEnd : AnyObject!
    open var  storeStart : AnyObject!
    open var  tags : [String]!
    open var  template : AnyObject!
    open var  typeHint : String!
    open var  uniqueKey : String!
    open var  updatedDate : Int!
    open var  vendorId : Int!


    public override init() {
        super.init()
    }

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let additionalPropertiesData = dictionary["additional_properties"] as? NSDictionary{
            additionalProperties = GeneralAdditionalPropertie(fromDictionary: additionalPropertiesData)
        }
        behaviors = [Behavior]()
        if let behaviorsArray = dictionary["behaviors"] as? [NSDictionary]{
            for dic in behaviorsArray{
                let value = Behavior(fromDictionary: dic)
                behaviors.append(value)
            }
        }
        category = dictionary["category"] as? AnyObject
        createdDate = dictionary["created_date"] as? Int
        displayable = dictionary["displayable"] as? Bool
        geoCountryList = [AnyObject]()
        geoPolicyType = dictionary["geo_policy_type"] as? AnyObject
        id = dictionary["id"] as? Int
        longDescription = dictionary["long_description"] as? String
        name = dictionary["name"] as? String
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
        storeEnd = dictionary["store_end"] as? AnyObject
        storeStart = dictionary["store_start"] as? AnyObject
        tags = dictionary["tags"] as? [String]
        template = dictionary["template"] as? AnyObject
        typeHint = dictionary["type_hint"] as? String
        uniqueKey = dictionary["unique_key"] as? String
        updatedDate = dictionary["updated_date"] as? Int
        vendorId = dictionary["vendor_id"] as? Int
    }


}
