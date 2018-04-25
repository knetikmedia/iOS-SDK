//
//    Item.swift
import Foundation

open class Item :NSObject {

    open var  additionalProperties : GeneralAdditionalPropertie!
    open var  behaviors : [Behavior]!
    open var  category : AnyObject!
    open var  createdDate : NSNumber!
    open var  displayable : Bool!
    open var  geoCountryList : [AnyObject]!
    open var  geoPolicyType : AnyObject!
    open var  item_id : NSNumber!
    open var  longDescription : String!
    open var  name : String!
    open var  shippingTier : NSNumber!
    open var  shortDescription : String!
    open var  skus : [Sku]!
    open var  sort : Int!
    open var  storeEnd : AnyObject!
    open var  storeStart : AnyObject!
    open var  tags : [String]!
    open var  template : AnyObject!
    open var  typeHint : String!
    open var  uniqueKey : String!
    open var  updatedDate : NSNumber!
    open var  vendorId : NSNumber!
    open var ItemName:String!
    open var ItemId:NSNumber!
    open var invoiceId:NSNumber!

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
        createdDate = dictionary["created_date"] as? NSNumber
        displayable = dictionary["displayable"] as? Bool
        geoCountryList = [AnyObject]()
        geoPolicyType = dictionary["geo_policy_type"] as? AnyObject
        item_id = dictionary["id"] as? NSNumber
        longDescription = dictionary["long_description"] as? String
        name = dictionary["name"] as? String
        ItemName = dictionary["item_name"] as? String
        ItemId = dictionary["item_id"] as? NSNumber
        invoiceId = dictionary["invoice_id"] as? NSNumber
        shippingTier = dictionary["shipping_tier"] as? NSNumber
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
        updatedDate = dictionary["updated_date"] as? NSNumber
        vendorId = dictionary["vendor_id"] as? NSNumber
    }


}
