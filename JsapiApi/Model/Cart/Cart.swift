//
//    Cart.swift
import Foundation

open class Cart:NSObject{

    open var  availableShippingOptions : [AnyObject]!
    open var  countryTax : Int!
    open var  coupons : [AnyObject]!
    open var  created : Int!
    open var  currencyCode : String!
    open var  discountTotal : Int!
    open var  errorCode : AnyObject!
    open var  errorMessage : AnyObject!
    open var  grandTotal : Int!
    open var  id : String!
    open var  invoiceId : AnyObject!
    open var  items : [Item]!
    open var  owner : AnyObject!
    open var  selectedShippingOptions : [AnyObject]!
    open var  shippable : Bool!
    open var  shippingAddress : AnyObject!
    open var  shippingCost : Int!
    open var  stateTax : Int!
    open var  status : String!
    open var  subtotal : Int!
    open var  updated : Int!

    public override init() {
        
    }

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        availableShippingOptions = [AnyObject]()
        countryTax = dictionary["country_tax"] as? Int
        coupons = [AnyObject]()
        created = dictionary["created"] as? Int
        currencyCode = dictionary["currency_code"] as? String
        discountTotal = dictionary["discount_total"] as? Int
        errorCode = dictionary["error_code"] as? AnyObject
        errorMessage = dictionary["error_message"] as? AnyObject
        grandTotal = dictionary["grand_total"] as? Int
        id = dictionary["id"] as? String
        invoiceId = dictionary["invoice_id"] as? AnyObject
        items = [Item]()
        if let itemsArray = dictionary["items"] as? [NSDictionary]{
            for dic in itemsArray{
                let value = Item(fromDictionary: dic)
                items.append(value)
            }
        }
        owner = dictionary["owner"] as? AnyObject
        selectedShippingOptions = [AnyObject]()

        shippable = dictionary["shippable"] as? Bool
        shippingAddress = dictionary["shipping_address"] as? AnyObject
        shippingCost = dictionary["shipping_cost"] as? Int
        stateTax = dictionary["state_tax"] as? Int
        status = dictionary["status"] as? String
        subtotal = dictionary["subtotal"] as? Int
        updated = dictionary["updated"] as? Int
    }

}
